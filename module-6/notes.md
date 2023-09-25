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