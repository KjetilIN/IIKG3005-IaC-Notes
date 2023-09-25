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
    3. Give the secret a name.
        - Azure naming convention is names that are formatted like this => AZURE_CLIENT_ID  