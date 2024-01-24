
# Create a service principal with contributor role over the synapse workspace.
# For demo purposes we add this sp as a contributor to the subscription.
az ad sp create-for-rbac --name gh-loves-synapse \
--role Contributor \
--scopes /subscriptions/$(az account show --query id -o tsv)

# También hay darle permisos dentro del Workspace de Synapse en el apartado de Access Control (IAM)
# Scope Workspace > Role Synapse Administrator


terraform init -backend-config=backend.tfvars