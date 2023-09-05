# Naming Conventions for Azure

![image](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/_images/ready/resource-naming.png)


### Organizations

Top-level name of the organization, normally utilized as the top management group or, in smaller organizations, part of the naming convention. Example: ntnu


### Environment 	
The stage of the development lifecycle for the workload that the resource supports. 
Examples: ```prod, dev, qa, stage, test``````

### Location 	
The region or cloud provider where the resource is deployed. 
Examples: ```westus, eastus2, westeu, usva, ustx```


### Instance 	
The instance count for a specific resource, to differentiate it from other resources that have the same naming convention and naming components. Examples; ``` 01, 001``````

### Resource Groups

- Should start with **rg**
- Format should be; **rg**-app or service name-subscription purpose-###

Examples;
``````
- rg-mktgsharepoint-prod-001
- rg-acctlookupsvc-shared-001
- rg-ad-dir-services-shared-001
``````



## Tools / Resources

Read more about naming convention here;
https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-naming  