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