az ad sp create-for-rbac --name gh-loves-synapse --role Contributor --scopes /subscriptions/$(az account show --query id -o tsv)

terraform init -backend-config=backend.tfvars