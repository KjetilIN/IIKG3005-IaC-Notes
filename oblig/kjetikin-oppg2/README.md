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

# CI/CD

One of the requirements is to implement good CI/CD to make the terraform more scalable, secure and make the terraform code more maintaiable.

## Github Environments

The project uses three environments. One for each workplace.
The terraform configuration has some default values, but every variable has a default value. 
Each environment can be unique - change the Github Environment variables to change the terraform configuration. 

The three environments are: dev, stage and oblig_2_production.
They have by default 4 varibables each, and uses default variables for the other variables: 

![image](https://github.com/KjetilIN/IIKG3005-IaC-Notes/assets/66110094/b4fddedd-e2ce-468e-ab69-7bf89a143ec0)

![image](https://github.com/KjetilIN/IIKG3005-IaC-Notes/assets/66110094/dd43f7d8-d1d3-4245-8a64-3f9795c0f6e6)



## Workflow files - Checks and deployment

## Approval for production (Private and Public repository solutions)

## Successful deployment

## (EXTRA) Destroy by manual trigger
