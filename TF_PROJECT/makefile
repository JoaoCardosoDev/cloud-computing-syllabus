# Makefile for Terraform and Minikube operations

# Define variable files
VAR_FILES := netflix.tfvars meta.tfvars rockstart.tfvars

# Define the Minikube profile
MINIKUBE_PROFILE := project

# Default target
.PHONY: all
all: init

# Initialize Terraform
.PHONY: init
init:
	@echo "Initializing Terraform..."
	terraform init

# Plan with a specific variable file
.PHONY: plan
plan: 
	@echo "Usage: make plan VAR_FILE=<var_file>"
	@echo "Available variable files: $(VAR_FILES)"
	@exit 1

# Apply with a specific variable file
.PHONY: apply
apply:
	@echo "Usage: make apply VAR_FILE=<var_file>"
	@echo "Available variable files: $(VAR_FILES)"
	@exit 1

# Plan with a specific variable file
.PHONY: plan-var
plan-var:
	@echo "Planning with variable file: $(VAR_FILE)"
	terraform plan -var-file=$(VAR_FILE)

# Apply with a specific variable file
.PHONY: apply-var
apply-var:
	@echo "Applying with variable file: $(VAR_FILE)"
	terraform apply -var-file=$(VAR_FILE)

# Plan for destroy
.PHONY: plan-destroy
plan-destroy:
	@echo "Planning for destroy..."
	terraform plan -destroy

# Start Minikube
.PHONY: minikube-start
minikube-start:
	@echo "Starting Minikube with profile: $(MINIKUBE_PROFILE)"
	minikube start -p $(MINIKUBE_PROFILE)

# Clean up Terraform state
.PHONY: clean
clean:
	@echo "Cleaning up Terraform state..."
	terraform destroy -auto-approve