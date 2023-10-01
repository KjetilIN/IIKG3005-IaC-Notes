# Mandatory Assigment 1 - IIKG3005 IaC

> Created by Kjetil Indrehus (NTNU USERNAME: kjetikin)

## Purpose of each module

The root module uses a set of child modules to achieve the requirements. The modules are; 

### Network Module

The network module has a Virtual Network (VNET), Network Security Group (NSG), and two subnets. Additionally, it includes a Network Interface Card (NIC) to provide a connection to a public IP. This module requires the Public IP's ID and the specific IP address allowed to connect to the NIC. It serves as a central module to connect the other modules that need the resources. 

#### Output 

The Network module outputs the Network Interface Card ID, so that other resources can connect to it.


### Storage Account Module

Storage Account module has a storage account and a storage container. 

#### Output

Storage Account module has the primary access key as output, so that the Key vault can store it as secret. This output is marked as sensitive. 


### Key Vault Module

Key vault module has a key vault and a couple of secrets. The secrets that it holds is: 
- **Storage Account Accesskey** => Can be used to authorize access to the storage account 
- **Virtual Machine Username** => Username of a virtual machine 
- **Virtual Machine Password** => Password of the virtual machine

#### Output

The Module provides username and password for the VM as output. This output is marked as sensitive. 


### Virtual Machine Module

The virtual machine module has a Linux virtual machine. It also creates a public IP for that is given til the VM. The module requires to provide a username and password. Also you need to give the module a NIC id. 

#### Output

The virtual machine module has the public IP address of the virtual machine. 


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

Here is a list of all the dependencies the project has: 

- hashicorp/random

## Example root terraform.tfvars file 

To be able to plan and apply the code, you need a `terraform.tfvars` file. I have provided a sample of how the tfvars file could look. These are variables used for each module:

```tfvars
# Locals Variables for common tags:
company_name = "OperaTerra AS"
billing_code = "b12002"
department   = "it"
environment  = "prod"

# Project name
project_name = "phoenix"

# Location of all the resources
location = "westeurope"

# Resource group naming
rg_kv_name      = "kvit"
rg_network_name = "nwit"
rg_st_name      = "stit"
rg_vm_name      = "vmit"

# Credentials for VM
vm_name  = "webvm"
kvs_user = "jakob"
kvs_pass = "admin123"

# Allowed IP address
allowed_ip_address = "128.0.0.1"

```

# Demo: creating the resources 

This section will provide a demo of how it went when I tried deploying the project. It will contain some screenshots of the process. The goal is to login to the VM, and be able to see that the Network topology looks good! 

All of the commands use can be found in the **How to use terraform commands?** section above. 

### 1. Make a plan

We used the plan command to create a plan for the root module. It takes a couple of minutes, but no problem:

![plan](https://github.com/KjetilIN/IIKG3005-IaC-Notes/assets/66110094/ecdc281c-96d2-46fc-ae6f-16c26017a650)


### 2. Apply the plan

This step does also take some time. Using the plan we just created, we apply the plan;

![applying](https://github.com/KjetilIN/IIKG3005-IaC-Notes/assets/66110094/db6e0578-d221-4f79-8744-258c4a7b79f7)


![apply-complete](https://github.com/KjetilIN/IIKG3005-IaC-Notes/assets/66110094/cc5a695d-188f-4b3a-97f4-b3510cda80b7)



### 3. Check that the resource groups has been created!

After doing the terraform apply command, we got a success message. To view our project, we can first look at the resource groups, in Azure Portal;

![resource-groups-created](https://github.com/KjetilIN/IIKG3005-IaC-Notes/assets/66110094/79d1137e-549d-45ac-bc6e-3497989770c5)

Here is the resource group for the storage account: 

![rg-st](https://github.com/KjetilIN/IIKG3005-IaC-Notes/assets/66110094/d4304d36-42af-4fab-9776-153b48a26554)

Here is the resource group for the VM:

![rg-vm](https://github.com/KjetilIN/IIKG3005-IaC-Notes/assets/66110094/16705c64-6337-446d-8d5d-f58d6e8ed14b)


### 4. View the network information.

We can also see that there has been created two subnets in the VNET: 

![sn](https://github.com/KjetilIN/IIKG3005-IaC-Notes/assets/66110094/198cde70-6e52-4ee3-8dad-bd99633ef46b)

We can also see that our costume SSH rule was also added as a rule in the NSG;

![vm_securtiy_rule](https://github.com/KjetilIN/IIKG3005-IaC-Notes/assets/66110094/1b96fc63-4728-440d-a5eb-75c3da6b2b06)

The image below shows the network topology:

![vnet-toplogy-with-tags](https://github.com/KjetilIN/IIKG3005-IaC-Notes/assets/66110094/f2fc5ddd-1d5c-480b-a2ac-1c86f6c33033)


### 5. Login to the VM

My `.tfvars` file looks the same as the one I provided in this readme. So therefor we know what the password should be. First we need the public IP for the VM. We can find it in Azure Portal when we click on the virtual machine:

![vm](https://github.com/KjetilIN/IIKG3005-IaC-Notes/assets/66110094/179bdbd7-4e86-482f-9023-e23883008cd5)

Then we login to with ssh. That went without any issue: 

![Screenshot from 2023-09-28 18-14-36](https://github.com/KjetilIN/IIKG3005-IaC-Notes/assets/66110094/fbe59b8d-cd0e-4346-b900-a5d955fe2554)



