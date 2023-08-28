# Terraform CLI

### Make sure to login 
Login to azure using "azu login"


### Terraform Init
"terraform init" -> Terraform expects to be invoked from a directory that has configuration files written in terraform language - e.i - files with .tf. 

This command initialize a working directory for terraform. Should be used when writing new terraform configuration or cloning an existing one from version control. Safe to call multiple times. 

**Note:** If you add a new file, you need to run this command again. Why? When running this command you create one config. Even though there are multiple .tf files, it will be seen as the same config file. 


### Terraform Plan
"terraform plan" is the command for creating an execution plan, which lets you preview the changes that Terraform plans to do to the infrastructure. We will be using the following command:

- terraform plan -out=main.tfplan -> Only creates a plan file and DOES NOT APPLY IT could simply write over the file. However, doing this makes you loose the plan. In case of different environments, it may be good with multiple plans

If you were to make changes you could either write over the file or make a new file. If it is a bug, you 

### Terraform Apply
"terraform apply" is used to apply a plan and change the infrastructure as it is. Use the .tfplan file;

- terraform apply "main.tfplan"


### Terraform Destroy - Important to do 
"terraform destroy" -> Take down the managed infrastructure. Why? Having it up cost money, so we may need to take it down.


### Neat Commands
- terraform fmt -> Format the code so that it is more readable 


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


### THE THREE OPTION:

#### Directly into the main.tf file
With this approach:
To apply variables to the plan: terraform plan -var="varname=varvalue"

#### Variable file 
When creating a new variable file, you only add the variables to the file. This file is seen as a part of the configuration, but **remember to run terraform init again** so that the variables.tf is part of the config. 
Also to set the variable you use the -var flag, else the variable will have the default value. 

#### .tfvars file 

If you not want to set the variables in the terraform plan command, you can use a .tfvars file.
A good naming convention is to name this file; **terraform.tfvars**
In this file you mention all of the variables like an .env file;

```env
location="West Europe"
```

**NB!** Note that:
- This file should be gitignored, because it could contain secret data.
- You need to use the terraform init again, after creating the .tfvars file. 