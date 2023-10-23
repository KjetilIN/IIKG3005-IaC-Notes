# Oblig 2 - Terraform CI/CD

## Terraform scripts

## Dependencies

## Sample .tfvars file

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