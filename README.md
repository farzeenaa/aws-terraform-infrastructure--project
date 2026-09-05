# Automated Two-Tier Cloud Network Infrastructure using Terraform

##  Project Overview
An automated cloud networking and compute infrastructure deployed on **Amazon Web Services (AWS)** using **Terraform (Infrastructure as Code)**. This architecture builds an isolated virtual cloud network environment designed to host highly available applications securely, eliminating manual cloud configurations.

##  Architecture Design & Components
* **Networking (VPC)**: Isolated network space spanning custom IP ranges (10.0.0.0/16) to isolate corporate assets.
* **Public Subnet**: Internet-facing zone hosting public endpoints with custom internet gateways.
* **Security Layer (Firewall)**: Programmatic AWS Security Groups restricting inbound ingress traffic to port 80 (HTTP) while allowing unrestricted secure outbound egress upgrades.
* **Compute (EC2)**: Automated deployment of an Ubuntu virtual compute instance provisioned seamlessly via automated shell startup scripts (user_data) running an Apache2 web app.

##  Tech Stack & Skills Highlighted
* **Cloud Provider**: Amazon Web Services (AWS)
* **Infrastructure as Code**: Terraform (HCL)
* **Operating System / Scripting**: Ubuntu Linux, Bash Scripting
* **Network Security**: VPC Architecture, Subnets, Internet Gateways, Security Groups

##  Step-by-Step Deployment Guide

### 1. Prerequisites Configuration
Ensure you have the AWS CLI configured with active IAM access credentials, and HashiCorp Terraform installed locally.

### 2. File Execution Path
To run and execute this blueprint setup natively, execute the sequential lifecycle command structures:

```bash
# Initialize project modules and download AWS providers
terraform init

# Validate configuration scripts for syntax alignment
terraform validate

# Run a secure dry-run plan execution to preview deployment infrastructure
terraform plan

# Apply changes to provision resources live on AWS
terraform apply
```

## Deployment Verification Proof
Below is the verification showing the infrastructure running live in the AWS Console and the resulting web app accessed via a mobile browser:

![AWS EC2 Dashboard](aws-console-screenshot.png)
![Mobile Browser Live Verification](mobile-screenshot.jpg)

<img width="975" height="403" alt="image" src="https://github.com/user-attachments/assets/c97ace40-38e7-45c6-8310-722cb755d258" />
<img width="1080" height="296" alt="image" src="https://github.com/user-attachments/assets/1bf6e427-80a7-409a-a0d9-6e77b1e265a9" />
<img width="975" height="362" alt="image" src="https://github.com/user-attachments/assets/f965cac0-723c-408c-96d0-444509da7026" />




