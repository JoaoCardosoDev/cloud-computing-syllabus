# Multi-Client Deployment Project

This project deploys a Kubernetes cluster and Odoo application for a multitude of possible clients, for demonstration there are 3 on by default in the folder clients.

## Prerequisites

- Terraform
- Minikube
- kubectl

## Project Struture

```
   - TF_PROJECT (./)
   │   cert-manager.yaml
   │   main.tf
   │   outputs.tf
   │   README.md
   │   terraform-docs.md
   │   variables.tf
   │
   ├───clients
   │       meta.tfvars
   │       netflix.tfvars
   │       rockstar.tfvars
   │
   └───modules
      ├───cluster
      │       main.tf
      │       outputs.tf
      │       variables.tf
      │
      ├───database
      │       main.tf
      │       outputs.tf
      │       variables.tf
      │
      ├───ingress
      │       main.tf
      │       outputs.tf
      │       variables.tf
      │
      └───odoo
               main.tf
               outputs.tf
               variables.tf
```

## Deployment Instructions

1. Create the Minikube Profile:

   _Ensure the Minikube profile is created for the client. You can create it manually or let Terraform handle it dynamically if configured:_

   ```bash
   minikube start
   ```

2. Apply Cert-Manager:

   _Apply the cert-manager.yaml to set up the cert-manager for the Kubernetes cluster:_

   ```bash
   kubectl apply -f cert-manager.yaml
   ```

3. Enable Ingress Addon:

   _Enable the ingress addon for Minikube to manage external traffic to services:_

   ```bash
   minikube addons enable ingress
   ```

4. Initialize Terraform:

   _Initialize Terraform to set up the project environment:_

   ```bash
   terraform init
   ```

5. Create a Workspace:

   _Create a new Terraform workspace for each client environment (e.g., netflix-prod, meta-qa):_

   ```bash
   terraform workspace new netflix-prod
   ```

6. Plan the Terraform Changes:
   _Run terraform plan to see what changes Terraform will make based on the configuration and variables:_

   ```bash
   terraform plan -var-file=clients/netflix.tfvars
   ```

   - Review the output to ensure the plan is what you expect.

7. Apply Terraform Configuration:

   _Apply the Terraform configuration with the appropriate .tfvars file for your client:_

   ```bash
   terraform apply -var-file=clients/netflix.tfvars
   ```

   _You can customize any of the default values by providing additional variables, such as:_

   ```bash
   terraform apply -var-file=clients/netflix.tfvars -var="replicas=1" -var="qa"
   ```

   _You will be prompted to input any variables that are not set to a default, including the namespace and profile name._

8. Access the Odoo Application: Once the deployment is complete, access the Odoo application at https://<domain-name>. Replace <domain-name> with the domain name specified in the .tfvars file.
