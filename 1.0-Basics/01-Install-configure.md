# Install Terraform

Download binaries from https://www.terraform.io/downloads
Here is an exmaple of Amazon linux instance

- create ec2 instance
- connect to the instance
- Run the following commands 

```console
$ sudo yum install -y yum-utils
$ sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
$ sudo yum -y install terraform
$ terraform --version
Terraform v1.2.5
on linux_amd64
$ which terraform
/usr/bin/terraform
```