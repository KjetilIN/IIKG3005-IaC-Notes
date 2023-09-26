# Mandatory Assigment 1 - IIKG3005 IaC

## Purpose of each module

The root module uses a set of child modules to achieve the requirements. The modules are; 

### Network Module

### Storage Account Module

### Key Vault Module

### Virtual Machine Module


## How to use terraform scripts?

### Initialize Terraform 
To initialize a terraform configuration use this command;

```terminal
terraform init
```
Note that you have to run the command each time you make a changes. 

### Create a plan
To create a plan and NOT apply it use;
```terminal
terraform plan -out=main.tfplan
```
The plan does not have to be called `main`, so it could be called something specific, based on your need to store previous plans.

### Apply a plan 
When we say apply, we mean to create the resources that we have created a plan for. To apply a play, use this command with the a specific plan name

```terminal
terraform apply "main.tfplan"
```

### Destroy/remove infrastructure
After deploying the resources you may wish to delete them. You can destroy all resources that is managed by a particular Terraform infrastructure using the following command;

```terminal
terraform destroy
```

There is ways to avoid destroying a specific resource like a database, but generally a terraform will remove all resources unless specified. **Therefore use this command carefully, there is no turning back**


## Dependencies 


## Example root terraform.tfvars file 

To be able to plan and apply the code, you need a `terraform.tfvars` file. I have provided a sample of how the tfvars file could look. These are variables used for each module:

```tfvars
# This is test
rg_name="Test"


```

