## Locals 

Terraform Locals are named values which can be assigned and used in your code.
Locals can not be sent between modules.

Useful for tags for the whole configuration  

**NB** A Local is only accessible within the local module vs a Terraform variable which can be scoped globally

Use local values only in moderation, in situations where a single value or result is used in many places and that value is likely to be changed in future. The ability to easily change the value in a central place is the key advantage of local values.

## Options

1.You can implement locals directly in the main.tf file (With the resources)

2.You could also create a **locals.tf** file within the module.

3.You could also add all in **variables.tf** file, so that variables and locals are together. 


## Module

A module is just a folder with a set of terraform files that together provide IaC. 
A module is usually not dividable.


## Variable List

A list can be defined easily like so; 

```terraform

# Defining a list variable 
variable "az_regions" {
  type        = list(string)
  description = "Azure array for resources"
  default     = ["westeurope", "northeurope"]
}

``````

Note that a variable list can be of one type only. This is very useful for 

