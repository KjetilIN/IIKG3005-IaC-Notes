# Locals 

Terraform Locals are named values which can be assigned and used in your code.

**NB** A Local is only accessible within the local module vs a Terraform variable which can be scoped globally

Use local values only in moderation, in situations where a single value or result is used in many places and that value is likely to be changed in future. The ability to easily change the value in a central place is the key advantage of local values.

## Options

You can implement locals directly in the main.tf file

You could also create a locals.tf file within the module.