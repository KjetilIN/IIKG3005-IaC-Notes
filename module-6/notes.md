# Lecture Notes 25.sep 2023

- Read: Chapter 8: Continuously Test and Deliver
- Tests for declarative code has often low value
- Often complicated tests and slow infrastructure code is few of the challenges
- Testing in sequence => give feedback fast and reliable 

- Two central models for testing
    - Test pyramid
    - Swiss cheese testing model

- Through CI/CD, testing should be automated 
- Pipelines are triggered automatically or manually 
- CI/CD services like Github Actions, Azure Devops and more
    - Could also divide responsibility for 

- Possible failure: under/over test before rolling out production  

Terraform Backend:
- Using resources to make variables available for others
- Backend will be accessible by the  

Terraform Workspaces
- One or multiple environments created by the same repository


# Terraform Environment variables   

You can create your own environment variables by adding them to your session.
This is an example of this;

```terminal
export NAME_OWNER="Kjetil"

```

To view the environment variables we can just type `env` in the terminal.

# Github Secrets 

The backend will contain sensitive information, therefore we can add them as secrets in the repository
To add a new secret:
    1. Go to settings > Secrets > Actions
    2. Click create new secret
    3. Give the secret a name and the correct value
        - Azure naming convention is names that are formatted like this => AZURE_CLIENT_ID  

For using terraform some githubs secrets that are needed:

- AZURE_CLIENT_ID
- AZURE_CLIENT_SECRET
- AZURE_CREDENTIALS => har alle secrets i seg i en json
- AZURE_SUBSCRIPTION_ID
- AZURE_TENANT_ID

# Terraform Backend

A backend defines where Terraform stores its state data files. 
Terraform must store state about your managed infrastructure and configuration. 
This state is used to map real resources in configuration.

By default terraform uses a backend called local, and stores state locally on disk. 
Backends however are stored remotely. 

Azurerm backend stores the current state with the given key within the blob container within the Blob storage account. 
This backend supports locking state files anc consistency testing. Meaning that multiple people can work on the same state file, but there will be only allowed one change at the time, because the state file is locked. 


# Azure Key vault 

- One of many solutions for key management
- It can store secrets, keys and certificates. 
- Using Azure Key vault, you centralize the storage of application secrets so that they are easy to control their distribution.

F.exp
- Passwords and API keys
- Database connection string 

- The authentication is done through azure active directory, which is a role-based access control policy system.
- It is either software or hardware protected (based on your tier)
- Designed such that Microsoft cant see or extract data. 
- After creating vaults, you can monitor them to see when keys are being used.


**NB** Note that a vault is different from a key or secret. There is separate HC code for defining a secret!


# Azure Storage Account Access Keys

When you create a storage account, Azure generates two access keys for that account. These keys can be used to authorize access to your data. It is recommended to use Key Vault to manage access keys.  

# Workspaces 

When we work with terraform, we work with collections of resources. Most of the organization work with different collection of resources.
For instance, in a production environment we have a set of resources that may be different from development environment.

The workspaces store each a state file, more specificity a file that can be used to backup the system. It also contains a record of the run activity. Including summary, logs and a reference to the changes that caused the run. 

## How to create workspaces?

To list all of the workspaces and see what workspace you are currently in use;

```terminal
terraform workspace list
```

To create a new workspace called dev;

```terminal
terraform workspace new dev
```

For switching to the dev workspace:

```terminal
terraform workspace select dev
```

## How to use workspace specific variables:

Even though that you can create new workspaces and are in different workspaces when you apply the plan, you will still see the same variables getting deployed. The main reason for this is because the variables do not change based on the workspace. 

Therefore we use workspace specific labels:

```terraform
locals{
    # Getting the terraform workspace
    workspace_suffix = terraform.workspace == "default" ? "" : "${terraform.workspace}"

    #Using it in a variable
    rg_name = "${var.rg_name}-${local.workspace_suffix}"
}
```

This is really useful for having one repository that is able to change based on the workspace e.g the environment. 


# Providers file

For multiple providers, you could keep the information about the providers in a separate file. 