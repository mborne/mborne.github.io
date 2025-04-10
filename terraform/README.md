# Terraform

```bash
# get terraform version
terraform version
# swich working directory
terraform -chdir={path} <subcommand>
# initialize the directory
terraform init
# create an execution plan
terraform plan
# apply changes
terraform apply
```

```bash
# Output a deployment plan
terraform plan -out <plan_name>
# Output a destroy plan
terraform plan -destroy
# Apply a specific plan
terraform plan <plan_name>
```

```bash
# Apply changes to a target resource
terraform apply -target=<resource_name>
# Pass a variable
terraform apply -var <name>=<value>
# Get provider info
terraform providers
```
