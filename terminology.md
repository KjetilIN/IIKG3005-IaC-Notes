# Terminology

This markdown file about important terminology that is important for all modules.
They do not fit in a module, but may be important to understand.


## The Azure hierarchy
The image below shows how an organization can use the Azure hierarchy; <br>

![image](https://github.com/KjetilIN/IIKG3005-IaC-Notes/assets/66110094/6acb3bbb-bf41-4d4d-b0ec-e7d03c76e544)

Here is all of the layers; <br>

![image](https://github.com/KjetilIN/IIKG3005-IaC-Notes/assets/66110094/8c256492-0c50-4fe3-91e9-bce7487bed2f)


### Subscription 

Subscription contains multiple resource groups. 
Each subscription has limitations or quotas on the amount of resources it can create and use.
Using this hierarchy, organizations can manage billing easier.  

### Management groups  

A top level group that helps you manage access, policy and more for multiple subscriptions. All subscriptions inherit the conditions that are applied to the management groups 

### Resource Group 

A resource group is a container that holds resources. When the resources are in a group, it is usually because you want to manage resources as a group.
It is up to the administrator to create groups.

### Resource 

A resource is a manageable item that is available through Azure. 
This could be a VM, storage account, subscription, etc. 


### Tenant

A tenant is the organization that owns and manages a instance of cloud services. 

## VNET - Azure Virtual Network 

A virtual network is a way to make multiple types of resources communicate to each other. 
The difference between VNET and a normal network is that you use Azures infrastructure such as scalability , availability  an isolation.
A VNET can communicate to the public internet by assigning an IP or a load balancer. 


### Address Space

A range of IP addresses. Written with CIDR notation. 

> For example, if you deploy a VM in a virtual network with address space, 10.0.0.0/16, the VM is assigned a private IP like 10.0.0.4.


### Subnet

Enables you to segment a network into one or more sub-networks. 
Azure resources could be added to a specific sub-network


### Region

> A virtual network is scoped to a single region/location; however, multiple virtual networks from different regions can be connected together using Virtual Network Peering.


## NSG - Network Security Group

Allows you to filter out network traffic between Azure resources in an Azure virtual network. 
Based on rules, you can deny or allow network traffic. Could also be NSG for a specific subnet.
Acts like a firewall. 
