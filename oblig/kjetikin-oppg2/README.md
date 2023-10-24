# Oblig 2 - Terraform CI/CD

## Terraform scripts

## Dependencies

## Sample .tfvars file
For deploying locally, here is an example `.tfvars` file:

```env

# Common tags
company_name = "Bekk Consolting AS"
billing_code = "b001"
department   = "it"
project_name = "octopus"


# For the resources
location       = "westeurope"
rg_name        = "rgweb"
sa_name        = "saweb"
index_document = "index.html"
source_content = "<h1> Oblig 2 - Project Octopus </h1>"


```

## Workspaces 

This project has 3 workspaces:

- **Dev** => Used for development 
- **Stage** => Used for testing and preparing for deploying to production 
- **Prod** => The production environment

Each environment are deployed and behave separately based on the environment. 
To switch to development environment locally, use: 

```terminal
terraform workspace select dev
```

More about `terraform workspace` commands:
https://developer.hashicorp.com/terraform/cli/workspaces 

## CI/CD

## Successful deployment
