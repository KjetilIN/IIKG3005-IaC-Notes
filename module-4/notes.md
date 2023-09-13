# Lecture notes 11.sep 2023

- Chp 6 and 7 important for exam
    - Chp 6 is about environments 
    - Chp 7 is about configuring stack instances
    - Get to know all patterns for configuration stacks (EXAM)
- Video 04-02 -> demo of VM with ssh access 
- Configuration Registry: Store configuration data 

- Modules is a folder with configurations that fits together
- One root module that has the main configuration
- Root module has multiple child modules
- Could access modules with local path, terraform registry 
- Modules should be independent -> this is what makes modules have value.
- Weekly assignment is a bit bigger, with focus on good practice



## Modules

Modules are containers for multiple resources that are used together.
Every Terraform configuration has a root module. The root module can call other modules to include their resources in the configuration.

You can also publish modules for others to use. 

## Built-in Terraform Functions 

Terraform includes a lot of built-in functions that can be called from the configurations files. 

For numeric functions you have abs, ceil. floor, log, min , max, parseint and more 

For string functions you have lower, join , trim functions and a lot more

There are a lot of functions that are useful. For more read the documentation provided by terraform:
https://developer.hashicorp.com/terraform/language/functions/