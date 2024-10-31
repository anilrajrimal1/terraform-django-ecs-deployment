
# Django ECS Deployment with Terraform

This repository contains Terraform scripts for deploying a Django application on Amazon ECS (Elastic Container Service) with a PostgreSQL RDS instance for database management. The infrastructure is built with scalability, security, and reliability in mind, utilizing AWS services such as ECS, RDS, ALB (Application Load Balancer), and CloudWatch for logging and monitoring.

## Table of Contents
- [Project Overview](#project-overview)
- [File Structure](#file-structure)
- [Prerequisites](#prerequisites)
- [Infrastructure Architecture](#infrastructure-architecture)
- [Setup Guide](#setup-guide)
  - [Step 1: Configure Variables](#step-1-configure-variables)
  - [Step 2: Initialize Terraform](#step-2-initialize-terraform)
  - [Step 3: Plan the Deployment](#step-3-plan-the-deployment)
  - [Step 4: Deploy the Infrastructure](#step-4-deploy-the-infrastructure)
- [Useful Commands](#useful-commands)
- [Security and Best Practices](#security-and-best-practices)

## Project Overview
This project deploys a Django application on ECS, backed by a PostgreSQL database hosted on RDS. The deployment ensures secure networking and isolated resources to meet production-grade standards.

## File Structure
The project structure is as follows:
```
.
├── README.md
└── terraform_files
    ├── cloudwatch_log.tf
    ├── ecs_cluster.tf
    ├── ecs_service.tf
    ├── iam.tf
    ├── internet-gateway.tf
    ├── load_balancer.tf
    ├── nat_gw.tf
    ├── outputs.tf
    ├── provider.tf
    ├── rds.tf
    ├── route-table-association.tf
    ├── route-table.tf
    ├── security-group.tf
    ├── subnet.tf
    ├── task_definition.tf
    ├── terraform.tfstate
    ├── terraform.tfstate.backup
    ├── terraform.tfvars
    ├── variables.tf
    └── vpc.tf
```
## Prerequisites
- **Terraform**: Install [Terraform](https://www.terraform.io/downloads.html) for infrastructure provisioning.
- **AWS CLI**: Install and configure the [AWS CLI](https://aws.amazon.com/cli/).
- **Docker**: Ensure Docker is installed for containerization.

## Infrastructure Architecture
- **ECS Cluster**: Manages the Django application container.
- **RDS**: PostgreSQL database in a private subnet for secure data storage.
- **ALB**: Application Load Balancer for traffic distribution and SSL termination.
- **VPC**: Virtual Private Cloud with public and private subnets, NAT gateway, and security groups.

## Setup Guide

### Step 1: Configure Variables
Edit the `terraform.tfvars` file to set necessary variables like AWS region, VPC CIDR, database credentials, and application configurations.

### Step 2: Initialize Terraform
```bash
terraform init
```
Initializes the project and downloads necessary provider plugins.

### Step 3: Plan the Deployment
```bash
terraform plan
```
Generates an execution plan showing the resources to be created.

### Step 4: Deploy the Infrastructure
```bash
terraform apply
```
Applies the configuration and deploys resources on AWS. Type "yes" when prompted to confirm.

## Useful Commands
- **terraform init**: Initialize Terraform in your project directory.
- **terraform plan**: Review infrastructure changes.
- **terraform apply**: Apply changes to deploy resources.
- **terraform destroy**: Destroy resources in the infrastructure.

## Security and Best Practices
- **Environment Variables**: Use a secure method (e.g., AWS Secrets Manager) for sensitive data.
- **IAM Roles**: Least privilege policies for ECS and RDS.
- **Private Subnets**: RDS is hosted in private subnets for security.

---

This setup is ideal for testing or production environments needing containerized Django apps with PostgreSQL databases on AWS.
