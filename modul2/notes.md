# Terraform CLI

### Make sure to login 
Login to azure using "azu login"


### Terraform Init
"terraform init" -> Terraform expects to be invoked from a directory that has configuration files written in terraform language - e.i - files with .tf. 

This command initialize a working directory for terraform. Should be used when writing new terraform configuration or cloning an existing one from version control. Safe to call multiple times. 

Note: If you add a new file, you need to run this command again. 


### Terraform Plan
"terraform plan" is the command for creating an execution plan, which lets you preview the changes that Terraform plans to do to the infrastructure. We will be using the following command:

- terraform plan -out=main.tfplan -> Only creates a plan file and DOES NOT APPLY IT could simply write over the file. However, doing this makes you loose the plan. In case of different environments, it may be good with multiple plans

If you were to make changes you could either write over the file or make a new file. If it is a bug, you 

### Terraform Apply
"terraform apply" is used to apply a plan and change the infrastructure as it is. Use the .tfplan file;

- terraform apply "main.tfplan"


### Terraform Destroy - Important to do 
"terraform destroy" -> Take down the managed infrastructure. Why? Having it up cost money, so we may need to take it down.


# Terraform Variables

- We do not want to repeat ourself - DRY principle 
- Terraform allows you to make variables 
- You could add the variables in a variable.tf file, instead of directly in the main.tf file

Example 

```terraform
variable "location"{
    type = string
    description = "Deployment Location"
    default = "West Europe"
}

```


### .tfvars file 

For updating the variables for a configuration; use a .tfvars file to change them. 
They represents the content of the variables. 
