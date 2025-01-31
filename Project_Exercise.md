# Terraform Project: Multi-Client Kubernetes Cluster with Odoo Deployment

## Project Objective

Develop a comprehensive Terraform project that meets the following advanced requirements:

## Project Requirements

- [x] Create a flexible infrastructure that supports deployment for three distinct clients:
  - Netflix
  - Meta
  - Rockstar
- [x] Implement client-specific configuration mechanisms using variables and workspaces

### Kubernetes Cluster Requirements

- [x] Deploy a Kubernetes cluster using Minikube
- [x] Ensure robust and scalable cluster configuration
- [x] Support dynamic namespace creation

### Dynamic Namespace Management

- [x] Develop a flexible mechanism to create multiple Kubernetes namespaces
- [x] Support dynamic namespace generation (**e.g., dev, qa, prod**)

### Odoo Application Deployment

- [x] Implement Terraform resources for Odoo application deployment
- [x] Configure necessary Kubernetes services and dependencies
- [ ] Ensure application stability across different environments

### Production HTTPS Access

- [x] Implement secure HTTPS access for the Odoo application in production environments
- [x] Utilize Ingress and services for HTTPS traffic management
- [x] Configure SSL/TLS certificates

### Documentation Requirements

- [ x Generate comprehensive project documentation using terraform-docs
- [x] Include detailed information about:
    - [x] Project structure
    - [x] Variable definitions and purposes
    - [x] Deployment instructions
    - [x] Dependencies and prerequisites

## Deliverables

  - [x] Complete Terraform source code in a folder `TF_PROJECT` inside this repository (**0.5 points**)
  - [x] Code (**15 points detailed in [Code Evaluation Criteria](#code-evaluation-criteria)**) 
  - [x] Project documentation with Step-by-step deployment and testing instructions (**3.5 points**)
  - [x] Creation of a git tag (**0.5 points**)
  - [x] Text file in Google Drive pointing to your created tag github page (**0.5 points**)

### Code Evaluation Criteria
  - [x] Code quality and organization (**5 points**)
  - [x] Flexibility and scalability of the solution (**3 points**)
  - [x] Adherence to Terraform best practices for multiple clients (aka. workspaces) (**3 points**)
  - [x] Comprehensive documentation (**2 points**)
  - [x] Successful deployment across different client scenarios (**2 points**)