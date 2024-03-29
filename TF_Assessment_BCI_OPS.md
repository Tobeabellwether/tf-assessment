## Assessment definition

This assessment is testing Terraform programming skills. The assessment should take between four and eight hours.

You can use a cloud of your choice, prefferably one of: AWS, GCP or Azure.

The developed code must comply with the following requirements:

### General requirements

* spawn up a complete infrastructure from scratch (more details bellow)
* every parameter for resources customization must be stored in the terraform state, sensitive values must be marked explicitly
* if needed, a terraform wrapper script or program can be used
* if needed, multiple terraform state files can be used
* if needed, additional cloud services can be provisioned using the same code
* using existing TF modules and providers is allowed

### What has to be created (mandatory) via terraform code

* the code must be able create a configurable number of VMs (any number between 2 and 100); for each VM the following parameters can be specified:
  * the VM flavor
  * the VM image
* VM admin passwords must be generated automatically and should be different on each VM
* the VMs should reside in the same network VPC or virtual net and should be able to ping each other
* the code have to automatically run a ping from one VM to each other in a round-robin fashion (example for 3 VMs: VM 0 ping VM 1, VM 1 ping VM 2 and VM 2 ping VM 0) and record the result (fail/pass between source and destination)
* the results (ping outputs) must be aggregated in one terraform output variable

### Deliverables

#### Terraform code

The terraform code has to be made available in a public accessible repository. The repository has to contain at least:

* a README file explaining the variables format and the solution
* *.tf files containing Terraform code
* one example tfvars file used in the demo

#### Assessment demo

You will be required to present your solution in a follow-up call. 
During presentation of the solution, a demo must be conducted with at least two VMs.

The demo should clearly show the terraform plan and the output of the terraform apply step.
