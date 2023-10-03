# Backend and Workspaces
In todays assignment we are going to do the following:

## Part 1:
- Create a backend for storing state-files in a storage container (SC) in Azure Storage Account (SA). NB! This Azure SA and SC is going to be used as backend for further assignments and should not be destroyed. Plan your folder structure and make sure you dont overwrite the tfstate-file for the backend infrastructure in Azure. Makes sure to edit the backend config to use SA and SC for storing tfstate file. Verify the state fil in Azure SA SC, and now you can delete the tfstate fil in VS Code inventory.
   - Voluntary - Extra assignment: Create a bootstrap that creates a backend befor you deploy your infrastrucutre for upcoming projects and infrastructure (not coverd in videos)

## Part 2:
- Create a static website in Azure SA that can be deployed without further configuration from three different workspaces: dev, stage and prod. The infrastructure in Azure should indicate which environemt it belongs to with tags and naming convention. Tags should also have owner and billing. When you enter the website it should be easy to identify which environment your in:
- "Web page created with Terraform"
  "DEV"
  "STAGE"
  "PROD"
