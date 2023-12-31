# Oblig 2 - Terraform CI/CD

## About
This is the secound oblig for the IIKG3005 course. The task is as follows: 

> Use a small and simple known infrastructure (could be module 7 demo-infra from already known git repo: https://github.com/torivarm/iac-terraform.git). Set up secrets in your GitHub repository for Azure credentials and any other sensitive informasjon. Configure the Terraform AzureRM backend to store the state files in Azure Storage Account. Make sure the backend configuration supports workspaces by making the storage key dynamic based on the workspace name.

This oblig has a small infrastructure: a static webpage. The main focus of this oblig, is the workflows and the workspaces. 
The two workflow files checks the code, creates a pull request and deploys the infrastructure. 

## Terraform scripts

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
### Select a workspace 
This porject has three workspaces that one can change between. Reed more here: 
https://github.com/KjetilIN/IIKG3005-IaC-Notes/edit/main/oblig/kjetikin-oppg2/README.md#workspaces

To select a workspace simply use:
```terminal
terraform workspace select dev
```

## Dependencies
Here is a list of all the dependencies the project has: 

- hashicorp/random

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

Workflow overview:

![workflow-create-pr](https://github.com/KjetilIN/IIKG3005-IaC-Notes/assets/66110094/5dca31c9-a33e-4d15-a9af-e885dd6e90b7)

Pull request created: 

![pr-created](https://github.com/KjetilIN/IIKG3005-IaC-Notes/assets/66110094/44b9f034-7041-45d2-8d4c-5a610cee184c)


### 2. Deployment

**Triggered by:** Manualy in Github or when you approve a pull request

**How it works:** The goal of the workflow is to deploy to each workspace with their corresponding Github Environment variables.
Each environment works the same way: initializing the terraform configuration, select the correct workspace (or create it) and apply the configuration.
Each job is depedent on the last job to succed - if dev deployment failes, the workflow is cancelled. If dev was deployed, it tries to deploy stage. 

A simple test with curl is also added for each workspace. 

## Approval for production (Private and Public repository solutions)

Github offers a review of deployments. Changing the `oblig_2_production` environment protection rules, we can make it only deploy when we approve it do do so. 
To configure it, go to environment, select your environment and go to settings. Go to Deployment Protection rules and add a individual as a "Required reviewer".
With the correct configuration you will have to approve any deployment to the environment mentioned: 

![Screenshot from 2023-10-24 11-01-43](https://github.com/KjetilIN/IIKG3005-IaC-Notes/assets/66110094/3ffa6e0d-555b-46a8-90cf-90a3d04e1603)

After approval, it will start deploying to the workspace: 

![Screenshot from 2023-10-24 11-01-43](https://github.com/KjetilIN/IIKG3005-IaC-Notes/assets/66110094/1bd72c31-41b6-46a4-9503-26eabf641942)


This feature is only for public repositories or with Github Pro account. 
For private repostiories, I added a step where the workflow creates an issue that needs a approval comment before running the workflow. This workes well. If the repsository is public, we can just remove this step from the workflow. Here is a screenshot of the issue created: 

![ask-for-approval](https://github.com/KjetilIN/IIKG3005-IaC-Notes/assets/66110094/f8dab107-b3e2-4979-840e-fb594d07961f)

After writing a comment, the Github Actions Bot will continue the workflow:

![approved-bot-response](https://github.com/KjetilIN/IIKG3005-IaC-Notes/assets/66110094/7839565c-c57d-4ec4-a33f-510627c4354c)


## Successful deployment

### Github Screenshots 

After all of the different workspaces have been deployed correctly - three static websites are deployed.
In Github, you can see a successfull deployment here: 


![image](https://github.com/KjetilIN/IIKG3005-IaC-Notes/assets/66110094/ebfa716c-8516-4aaa-a007-77e474e9b1b7)

**NB!** Notice that the pull request was triggered by a pull request review

### Static Websites 
Each page will render different content based on the workspace. 
There will be an `<h3>` tag with the workspace name.

Here is the static website and proofe of successfull deployment: 

#### Dev

![dev-deployed](https://github.com/KjetilIN/IIKG3005-IaC-Notes/assets/66110094/2edd8c21-e902-4d78-9b72-34e9bf74ef3d)

#### Stage

![stag-deployed](https://github.com/KjetilIN/IIKG3005-IaC-Notes/assets/66110094/65928cc2-9ce0-4179-8de4-25c119f2d7f1)

#### Prod

![prod-deployed](https://github.com/KjetilIN/IIKG3005-IaC-Notes/assets/66110094/750f823a-2eb1-4863-8193-d663882ed523)


## (EXTRA) Destroy by manual trigger

The same workflow file that deployes the infrastructure is also able to destroy the infrastructure with a manual trigger.
When triggering it manually, you will get a windown that asks what you want to do:

![image](https://github.com/KjetilIN/IIKG3005-IaC-Notes/assets/66110094/4b2e46c5-3426-4ebf-acf2-f596e0ceef9f)

After selecting destroy, the workflow will destroy all resources for the configuration. 
After getting approvement, resources will be destroyed for all workspaces: 


![image](https://github.com/KjetilIN/IIKG3005-IaC-Notes/assets/66110094/ad1f4071-e11a-4550-93f3-41751727ee5a)


### (Extra) Github links

In case of broken images or what to see the repsotiory in Github, see the links below:

- This readme file in my Github Repostory: https://github.com/KjetilIN/IIKG3005-IaC-Notes/blob/main/oblig/kjetikin-oppg2/README.md
- Github Oblig folder: https://github.com/KjetilIN/IIKG3005-IaC-Notes/blob/main/oblig/kjetikin-oppg2
- Workflow file nr 1 - Code validation: https://github.com/KjetilIN/IIKG3005-IaC-Notes/blob/main/.github/workflows/oblig_2_testing_and_create_pr.yml
- Workflow file nr 2 - Deployment: https://github.com/KjetilIN/IIKG3005-IaC-Notes/blob/main/.github/workflows/oblig_2_deploy.yml

