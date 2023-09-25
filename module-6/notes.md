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