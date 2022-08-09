# Basic Terraform commands

```console
$ terraform init
$ terraform plan
$ terraform apply
$ terraform apply -replace =<resource>
$ terraform refresh
$ terraform destroy
# Destroying specifc traffic
$ terraform destroy -target <reourcetype.localresourcename>
$ terraform fmt
$ terraform validate
$ terraform taint
$ terraform graph


$ terraform plan -out=demopath
$ terraform output <outputname>
$ terraform plan -target=resource
$ terraform apply -auto-approve
terraform plan -refresh=false
terraform workspace new <name>
terraform workspace show
terraform workspace list
terraform workspace select <workspace>

terraform state list
terraform state mv oldresource newresource
terraform state pull 
terraform state push
terraform state rm
terraform state show <resource name>

terraform import <resourcename> <resource>