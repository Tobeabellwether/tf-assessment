import json
import subprocess
import paramiko
from time import sleep

ssh_user = "jialun"
ssh_key = "/home/jialun/.ssh/id_rsa"


def create_ssh_client(server_ip, user, key_file):
    ssh_client = paramiko.SSHClient()
    ssh_client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh_client.connect(hostname=server_ip, username=user, key_filename=key_file)
    return ssh_client


def main():
    terraform_output = subprocess.run(
        ["terraform", "output", "-json", "instance_ips"],
        capture_output=True,
        text=True,
        check=True,
    ).stdout
    instance_ips = json.loads(terraform_output)

    ping_results = {}

    for i, instance_ip in enumerate(instance_ips):
        current_instance_name = instance_ip["instance_name"]

        try:
            ssh_client = create_ssh_client(
                instance_ip["external_ip"], ssh_user, ssh_key
            )

            next_instance_index = (i + 1) % len(instance_ips)
            next_instance_name = instance_ips[next_instance_index]["instance_name"]
            next_instance_ip = instance_ips[next_instance_index]["internal_ip"]

            ping_command = f"ping -c 4 {next_instance_ip}"
            stdin, stdout, stderr = ssh_client.exec_command(ping_command)

            # Wait for the command to complete and print the output
            exit_status = stdout.channel.recv_exit_status()
            if exit_status == 0:
                ping_result = (
                    f"Success: from {current_instance_name} pinged {next_instance_name}"
                )
            else:
                ping_result = f"Failure: from {current_instance_name} to ping {next_instance_name}, {stderr.read().decode()}"

            ping_results[current_instance_name] = ping_result

        except Exception as e:
            ping_results[current_instance_name] = f"Error: {str(e)}"

        finally:
            if ssh_client:
                ssh_client.close()

        sleep(1)

    print(json.dumps(ping_results))
    
if __name__ == "__main__":
    main()
