# Github Action

## Input

For running a github action manually from the command line you could add an input. 
Below is an example of having a input be a choice. Note that choice input has no default value.

```yml
workflow_dispatch:
    inputs: 
      action_type:
        description: 'What action should be performed? (apply/destroy)'
        required: true
        default: 'apply'
        type: choice
        options:
          - 'apply'
          - 'destroy'
```

You can also decide what action to take based on what the last commit message was;

```yml
- name: 'Conditionally run Terraform action'
        run: |
          if [[ "${{ steps.commit.outputs.message }}" == *"destroy"* ]]; then
            terraform destroy -auto-approve
          else
            terraform apply -auto-approve
          fi
        working-directory: ${{ env.WORKING_DIR }} 
```

## What is Github Actions?

Github actions is a CI/CD platform that allows you to automate pipelines. 
To get stared, create a Github Action workflow and decide what events that should trigger this workflow:
  - Workflow is a file that contains one or more jobs that is going to be ran in sequence or in parallel. It is a configurable automated process defined my a YAML file. 
  - An event is an activity in a repository that triggers a workflow. There is a lot of different event types, making workflows flexible and relatively easy to trigger.
  - A job is a set of steps in a workflow that is executed on a runner. Each step is executed in order. Each step is executed in the same runner and will therefore share the same data. By default, a job has no dependencies, meaning that jobs will be executed in parallel. But you can make a job take the dependency of another job:
    - The result is that this job will not run until the dependent job has ran without error. This way, we can design jobs in such a way that we get feedback faster!
  - A runner is a server that runs your workflows when they are triggered. Each runner is a new fresh virtual machine, ready to execute the jobs that have been defined. The runners are hosted by Github, but you can manually host a runner. (Very few cases where you actually need to do this)


## How to get started with a workflow?

You create a workflow in `.github/workflows/*.yml`. You can also get the workflows from the Github Marketplace and use them in your own workflow file. 

## Important features of Github Actions

Github Actions allows you to use variables. This can be a global environment variable defined in the top top the workflow, for a single job or just for a step. 
There, you can access variables that have been defined in a Github Environment. Instead of defining each variable from there, you can mention what environment you are going to use and then you will have access to all env variables. This is a nice way to get parameters and provide them to the terraform configuration. Lets say that we create an Github environment for all three stages: prod, stage and dev. There, we can define the same variables and set different values. This also makes it easy to change later. Then by defining these variables as `TF_VAR` prefix, it will be a given as variable to the terraform runner. 


# How does Github Actions support CI?

Continuous Integration is a software practice that requires frequent committed code to a repository. 
With a single workflow you can get CI by triggering a build, test, deploy workflow, triggered by an event! When a test goes well, it will be able to integrate to the codebase.

# How does Github Action support CD?

Continuous Deployment is a practice used to publish and deploy software. With a workflow file, you can deploy your code after a successful test. You can also make it so that you need approval from a github user before deploying to the environment. 