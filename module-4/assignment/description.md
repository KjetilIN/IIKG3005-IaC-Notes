# Modules and output
In todays assignment we are going to do the following:
We have now the knowledge of modules added to all the previous lecures.
Create a new working directory for this weeks assignment, which is going to be our root module. Create subfolders which is going to reprensent different parts of the infrastructure.

The infastructure is going to consist of:
- Virtual Network with a subnet and a NSG added to the subnet
   - The NSG should only allow SSH inbound from your PC public IP
     (https://whatismyipaddress.com)
- A VM (Linux) with a public IP-address which you can access.
   - I know the video shows how to create a VM with the password in clear text, but we will cover how to work with secrets etc. in the next lesson.

All Resource Groups and Resources must have a tag that tells the company, which project, billing department and owner. All infrastructure stacks could also have their base_name for naming convention.

How will you create this infrastructure with the knowledge from todays chapters: 
- Building Environments with Stacks
- Configuring Stack Instances
- How to input values?
- How to make sure the child modules get the correct values when called from the root module?
    - Hard coded value in the main?
    - Use of variables with the -var flag in the command line?
    - Use of .tfvar files?
 
# Solution

Was able to create the VNET with a public IP and the VM connected.
Some of the issues were:

- What resouces should be grouped together?
- How to create a good flow between the modules.

Below you can see the result from the azure portal;

![Screenshot from 2023-09-11 17-08-59](https://github.com/KjetilIN/IIKG3005-IaC-Notes/assets/66110094/b5205216-337e-4e5d-86aa-82627134b02c)

And here you can see that I am inside the VM that I created;

![Screenshot from 2023-09-11 17-06-58](https://github.com/KjetilIN/IIKG3005-IaC-Notes/assets/66110094/69fbf6c0-8814-42cd-9e59-d1ac9f6b44ce)
