#Terraform CLI

### Make sure to login 
Login to azure using "azu login"


### Terraform Init
"terraform init" -> Terraform expects to be invoked from a directory that has configuration files written in terraform language - e.i - files with .tf. 

This command initialize a working directory for terraform. Should be used when writing new terraform configuration or cloning an existing one from version control. Safe to call multiple times. 


### Terraform Destroy - Important to do 
"terraform destroy" -> Take down the managed infrastructure. Why? Having it up cost money, so we may need to take it down.

