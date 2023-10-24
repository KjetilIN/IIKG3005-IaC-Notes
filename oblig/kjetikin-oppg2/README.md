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

This project has two workflow files:

1. Code validation before PR created - With the filename `oblig_2_testing_and_create_pr.yml`
2. Deployment to all workspaces - With the filename `oblig_2_deploy.yml `

**NB!** For the delivery, the workflow files is provided in a folder called `workflows` in the root folder.
However, in my personal repository is the workflow files higher up - in my repository root folder.
Paths in the workflow is therefore wrong. 

My repository can be found here (should be private):
https://github.com/KjetilIN/IIKG3005-IaC-Notes 

### 1. Code validation

**Triggered by:** push to the correct path to a branch that is not main

**How it works:** The goal is to validate the code before we create a pull request. 
First running terraform validate - a simple built-in validation of the configuration 
This is a really simple test that we acpect to fail fast before we run the other tests.

The next to tests runs in parralel - tfsec and tflint. Tfsec will only report HIGH or CRITICAL. 

The last step is to create a pull request. It generetes all the content of the pull request itself:
- Title is created based on the branch name and current time the workflow is runned
- Description is created by taking the latest 5 commit messages using the `git log` command

![workflow-create-pr](https://github.com/KjetilIN/IIKG3005-IaC-Notes/assets/66110094/5dca31c9-a33e-4d15-a9af-e885dd6e90b7)


### 2. Deployment

**Triggered by:** Manualy in Github or when you aprove a pull request

**How it works:** 


## Approval for production (Private and Public repository solutions)

## Successful deployment

## (EXTRA) Destroy by manual trigger
