# Basics

## Providers

- Type of providers are - AWS,AZURE,GCP
- Some are maintained officially by Hashicorp
- Specific version of provider can be provided in provider block
- command to upgrade the latest version of the provider

 ~~~cmd
 $ terraform init -upgrade

 ~~~

- provider(downloaded locally) interacts with the provider via api
- multiple providers can be declared via alias. Here is an example:

 ~~~tf
 provider "aws" {
   region = "ap-southeast-2"
 }

 provider "aws" {
   alias  = "singapore" 
   region = "ap-southeast-1"
 }
 ~~~

- Provided block syntax is changed from 0.13 and it should be followed as a best practice even for the providers which are maintained directly by Hashicorp. Here is an example: 



~~~console
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.22.0"
    }
  }
}
~~~


## Basic commands

- terraform init- command is used to initialize the working directory and download all the  provider's plugin, modules locally
- terraform plan( dry run command)- creates an execution plan and it gives a preview about the changes that will happen over the execution.
- terraform plan - to apply changes and and it writes data to the terraform.tfstate file
- terraform refresh - to reconcile the state terraform( state file) with the real world infrastructure, it can change the state file
- terraform destroy - to destroy the terraform managed infrastructure, resources can be destroyed by using target flag
- resource can be also destroyed by removing the resource from the code and rerun the plan and apply
- terraform fmt - for formatting of the code
- terraform validate - check syntax , can be used as a part of continuous integration


## terraform state files

- terraform stores the meta data in states file
- Using state file , terraform can determine the infrastructure state
- When a resource is destroyed then tf state file is also removed
- It is always recommended to declare all resources in tf file so that desired state always matches the actual state
- should be aware about the version of providers
- dependency lock file

## terraform variables
  
- It can imported using file( terraform.tfvars), custom file can be passed through the CLI
- It can be set using command line argument
- It can be passed as environment variable (setx)
- Default value can be defined
- If no value is defined , it will ask for a value (no error will come)
- terraform env variables must be defined TF_VAR_name

### variable load order

- terraform.tfvars
- terraform.tfvars.json
- *.autotfvars  or *.auto.tfvars.json
- -var file on the command line


## datatypes

- string ( like test)
- list ( like an array )
- map (key value pair)
- number ( like a number 80)

## count

- used to create the repeatable resources

## functions

- Inbuilt functions are available
- numeric, string , collection, encoding, filesystem, data and time, hash & crypto, ip network, type conversion
- functions can be tested using terraform console command

## Data sources

## terraform debug/format/ validate

- set the log value export TF_LOG=TRACE, DEBUG,INFO,
- to persist the logged output, pass the parameter  export TF_LOG_PATH = "set the path"
- terraform fmt command to do the indentation

## dynamic blocks

- can be used for configuring Security groups

## taint

- it will mark the resource to be recreated in the next run

## splat

- it provides the list of all attributes

## zipmap

- it provided the combined output of two lists

## provisioner

- local-exec ( run on the local machine, it invokes the local executable)
- remote exec ( remote server)
- last resort, recommended to used configuration management tools
- on_failure setting can be changed to change the behavior of the execution
- creation-time provisioner and destroy time provisioner

## modules

- calling child module output using - module.<MODULENAME>.<OUTPUTNAME>

## Structure of module

- README>MD
- main.tf
- variables.tf
- outputs.tf

## Module versions

- always constrain the module version  for each external module to avoid unexpected or unwanted changes
- version constraints are supported only for modules installed from a module registry , such as terraform registry or terraform cloud's private module registry


## terraform registry 

- Syntax for a registry module:

~~~tf

module "consul" {
  source = "hashicorp/consul/aws"
  version = "0.1.0"
}

# private registry

module "vpc" {
  source = "app.terraform.io/example_corp/vpc/aws"
  version = "0.9.3"
}

~~~

## terraform workspaces

- each workspace can have different set of environment variables associated with it.
- workspace allows to have different state files for each workspaces 

# Output

- sensitive can be used to suppress the values over CLI, still the value will be present in state file

## Sentinel

- Policy  to enforce compliance
- It is a paid feature
- hard mandatory , soft mandatory
- It can be be pushed only at IAC level

## terraform import

- it can only import existing resources and can;t generate the configuration
- it is important to write the manual code to which imported object will be mapped

~~~tf
terraform import aws_instance.myec2 instance-id
~~~

## terraform enterprise

- SSO integration
- team and governance
- private data center networking
- clustering

## backend

- backend can be changed from default, when backend is changed , it gives the option to migrate the state to the new backend
- by default , it uses the local backend

## general

- implicit dependency can be used to oder the creation of resources 
- tostring is not a string function
- terraform can limit the number of concurrent operations as Terraform walks the graph using the -parallelism=n  argument. The default value for this setting is 10. This setting might be helpful if you're running into API rate limits.
- HashiCorp style conventions state that you should use 2 spaces between each nesting level to improve the readability of Terraform configurations.
- dependency (https://learn.hashicorp.com/tutorials/terraform/dependencies)
- Terraform supported on FreeBSD, Linux , macOS , solaris , Windows