# IIKG3005-IaC-Notes

### About the Course
    ✔️ Infrastructure programming, including stack provisioning and server configuration
    ✔️ Modular infrastructure design
    ✔️ Continuous infrastructure delivery and testing
    ✔️ Workflow and patterns for provisioning and updating servers



### Modules Overview
The course was teached in different modules. Each module talks about a different topic. 
Here is a table of all the topics and content that was talked about during this course;

| **Module** | **Topic**              | **Description**                                      | **Link to notes**                                                                       | **Link to Folder**        |
|------------|------------------------|------------------------------------------------------|-----------------------------------------------------------------------------------------|---------------------------|
| 2          |   Terraform CLI        |   Using cli commands like "plan, apply, destroy".   |  [module-2/notes.md](https://github.com/KjetilIN/IIKG3005-IaC-Notes/blob/main/module-2/notes.md)   |        [module-2/deployresources/](https://github.com/KjetilIN/IIKG3005-IaC-Notes/tree/main/module-2/delpoyresources)                 |
| 2          |   Terraform Variables  |   Using variables with terraform                     |  [module-2/notes.md](https://github.com/KjetilIN/IIKG3005-IaC-Notes/blob/main/module-2/notes.md)   | [module-2/variables-demo/](https://github.com/KjetilIN/IIKG3005-IaC-Notes/tree/main/module-2/variables-demo)                         |
| 3          |   Terraform Locals  |   Using locals with terraform                     |  [module-3/notes.md](https://github.com/KjetilIN/IIKG3005-IaC-Notes/blob/main/module-3/notes.md)   | [module-3/locals-demo/](https://github.com/KjetilIN/IIKG3005-IaC-Notes/tree/main/module-3/locals-demo)                         |
| 3          |   Variables: Maps and List |   Using lists and maps in terraform variables                    |  [module-3/notes.md](https://github.com/KjetilIN/IIKG3005-IaC-Notes/blob/main/module-3/notes.md)   | [module-3/list-map-demo/](https://github.com/KjetilIN/IIKG3005-IaC-Notes/tree/main/module-3/list-map-demo)                         |
| 3          |   Output |   Used to exspose information to parent modules                    |  [module-3/notes.md](https://github.com/KjetilIN/IIKG3005-IaC-Notes/blob/main/module-3/notes.md)   | [module-3/output/](https://github.com/KjetilIN/IIKG3005-IaC-Notes/tree/main/module-3/output)                         |
| 4          |   Modules |   Using modules in terraform                   |  [module-4/notes.md](https://github.com/KjetilIN/IIKG3005-IaC-Notes/blob/main/module-4/notes.md)   | [module-4/module-demo/](https://github.com/KjetilIN/IIKG3005-IaC-Notes/tree/main/module-4/module-demo)                         |
| 6         |   Backend |   Using backend in terraform          |  [module-6/notes.md](https://github.com/KjetilIN/IIKG3005-IaC-Notes/blob/main/module-6/notes.md)   | [module-6/backend/](https://github.com/KjetilIN/IIKG3005-IaC-Notes/tree/main/module-6/backend)                         |
| 7         |   Github Action |   Using github actions to create workflow that deploy a terraform configuration |  [module-7/notes.md](https://github.com/KjetilIN/IIKG3005-IaC-Notes/blob/main/module-7/notes.md)   | [module-7/](https://github.com/KjetilIN/IIKG3005-IaC-Notes/tree/main/module-7/)                         |



### Assignments:
This course had also mandatory assignments. To take the exam you have to pass the assignments!
There were also assignments that was not mandatory. Here is a full overview of all the assigments that I solved; 

| **Mandatory** | **Title**                                   | **Description**                                                                                                              | **Link to folder** |
|---------------|---------------------------------------------|------------------------------------------------------------------------------------------------------------------------------|--------------------|
|     ⭕️        |  Configuration with locals and variables    | Create 3 SA & 2 VNET. [Read description.md here!](https://github.com/KjetilIN/IIKG3005-IaC-Notes/blob/main/module-3/assignment/description.md )           |  [module-3/assignment/](https://github.com/KjetilIN/IIKG3005-IaC-Notes/tree/main/module-3/assignment)      |
|     ⭕️        |  Using Modules to create a configuration    | Create a VM that connects to a VNET. [Read description.md here!](https://github.com/KjetilIN/IIKG3005-IaC-Notes/blob/main/module-4/assignment/description.md )           |  [module-4/assignment/](https://github.com/KjetilIN/IIKG3005-IaC-Notes/tree/main/module-4/assignment)      |
|     🟢        |  Oblig 1: IT Consultant Configuration    | Create a configuration for an IT consultant firm with a set of requirements. [Read description.md here!](https://github.com/KjetilIN/IIKG3005-IaC-Notes/blob/main/oblig/oppg1_description.md)            |  [oblig/kjetikin-oppg1](https://github.com/KjetilIN/IIKG3005-IaC-Notes/tree/main/oblig/kjetikin-oppg1)      |
|     ⭕️        |  Static webpage   | Create a static webpage and use workspaces to deploy mulitple [Read description.md here!](https://github.com/KjetilIN/IIKG3005-IaC-Notes/blob/main/module-4/assignment/description.md )           |  [module-6/web-demo/](https://github.com/KjetilIN/IIKG3005-IaC-Notes/tree/main/module-6/web-demo)      |
|     ⭕️        |  Workflow for oblig 1   | Create a workflow that deployes oblig 1 in three environments; dev, stage_prod and prod.         |  [.github/workflows/oblig1_deploy.yml](https://github.com/KjetilIN/IIKG3005-IaC-Notes/tree/main/.github/workflows/oblig1_deploy.yml)      |
|     🟢       |  Workflow Automation | Create that workflow deployes a small congiguration in three environments; dev, stage and prod.         |  [./oblig/kjetikin-oppg2](https://github.com/KjetilIN/IIKG3005-IaC-Notes/tree/main/oblig/kjetikin-oppg2)      |
|     ⭕️        |  Oblig 1 Copy   | Apply the theory, and create a better version of oblig 1 [Read description.md of oblig 1 here!](https://github.com/KjetilIN/IIKG3005-IaC-Notes/blob/main/oblig/oppg1_description.md)            |  [oblig/kjetikin-oppg1-cpy](https://github.com/KjetilIN/IIKG3005-IaC-Notes/tree/main/oblig/kjetikin-oppg1-cpy)      |
