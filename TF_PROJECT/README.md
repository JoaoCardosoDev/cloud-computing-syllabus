# Multi-Client Deployment Project

This project deploys a Kubernetes cluster and Odoo application for a multitude of possible clients, for demonstration there are 3 on by default in the folder clients.

## Prerequisites
- Terraform
- Minikube
- kubectl

## Deployment Instructions
1. Create the Minikube Profile: 

   *Ensure the Minikube profile is created for the client. You can create it manually or let Terraform handle it dynamically if configured:* 

   ```bash
   minikube start
   ```

2. Apply Cert-Manager: 

   *Apply the cert-manager.yaml to set up the cert-manager for the Kubernetes cluster:*

   ```bash
   kubectl apply -f cert-manager.yaml
   ```

3. Enable Ingress Addon: 

   *Enable the ingress addon for Minikube to manage external traffic to services:*

   ```bash
   minikube addons enable ingress
   ```

4. Initialize Terraform: 

   *Initialize Terraform to set up the project environment:*

   ```bash
   terraform init
   ```

5. Create a Workspace: 

   *Create a new Terraform workspace for each client environment (e.g., netflix-prod, meta-qa):*
   ```bash
   terraform workspace new netflix-prod
   ```

6. Plan the Terraform Changes: 
   *Run terraform plan to see what changes Terraform will make based on the configuration and variables:*

   ```bash
   terraform plan -var-file=clients/netflix.tfvars
   ```

   * Review the output to ensure the plan is what you expect.

6. Apply Terraform Configuration: 
   
   *Apply the Terraform configuration with the appropriate .tfvars file for your client:*
   ```bash
   terraform apply -var-file=clients/netflix.tfvars 
   ```
   *You can customize any of the default values by providing additional variables, such as:*
   ```bash
   terraform apply -var-file=clients/netflix.tfvars -var="replicas=1" -var="qa"
   ```
   *You will be prompted to input any variables that are not set to a default, including the namespace and profile name.*

7. Access the Odoo Application: Once the deployment is complete, access the Odoo application at https://<domain-name>. Replace <domain-name> with the domain name specified in the .tfvars file.
