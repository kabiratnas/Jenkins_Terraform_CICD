# Jenkins + Terraform AWS EC2 Provisioning

This project automates AWS infrastructure provisioning using Jenkins and Terraform. It sets up EC2 instances within a custom VPC. Jenkins handles the CI/CD pipeline and integrates with Terraform to run infrastructure operations (`init`, `plan`, `apply`, and `destroy`) via a parameterized pipeline.

---

## Features & Workflow

- Automated Terraform Deployment via Jenkins
- Parameterized Jenkins Pipeline
  - `TAG_NAME` (Server_dev, Server_test, Server_prod)
  - `INSTANCE_COUNT` (default: 5)
  - `TERRAFORM_ACTION` (init, plan, apply, destroy)
- Creates custom VPC and Security Group
- Deploys EC2 instances with dynamic tagging
- Modular and scalable configuration

---

## Project Structure

```
Jenkins_Terraform_CICD/
├── ec2/                  # Terraform configuration directory
├── Jenkinsfile           # Jenkins pipeline definition
├── main.tf               # Terraform main infrastructure file
├── variables.tf          # Terraform input variable definitions
├── README.md             # Documentation
```

---

## Setup Instructions

### Prerequisites

- AWS account with EC2/VPC permissions
- Jenkins installed with:
  - Terraform Plugin
  - Git Plugin
- Terraform CLI installed (`terraform --version`)
- GitHub repository with Jenkinsfile and Terraform code

---

## Terraform Configuration

- VPC: CIDR block `172.31.0.0/16`
- Security Group: Allows inbound traffic on:
  - Port `8080` (Jenkins)
  - Port `3389` (RDP)
- EC2 Instances:
  - Key Pair required (configure in `main.tf`)
  - Default `t2.micro` instance type (customizable)
  - Instance count configurable via Jenkins parameter
- Tagging: Dynamic tags using `TAG_NAME` (e.g., Server_dev, Server_test, Server_prod)

---

## How to Run the Jenkins Pipeline

### 1. Install Jenkins and Required Plugins
```bash
sudo apt update && sudo apt install jenkins -y
```
In Jenkins:
- Install Terraform Plugin
- Install Git Plugin
- Restart Jenkins if needed

### 2. Clone This Repository
```bash
git clone https://github.com/YOUR_USERNAME/Jenkins-Terraform-CICD.git
```

### 3. Create a New Jenkins Pipeline Job
- Open Jenkins > New Item > Pipeline
- Set name and choose "Pipeline" type
- In configuration:
  - Choose "Pipeline from SCM"
  - SCM: Git
  - Repository URL: Your GitHub repo link
  - Script Path: Jenkinsfile

### 4. Run the Pipeline
- Click Build with Parameters
- Input:
  - `TAG_NAME`: Server_dev, Server_test, or Server_prod
  - `TERRAFORM_ACTION`: init & plan, apply, or destroy
  - `INSTANCE_COUNT`: e.g., 5
- Click Build

---

## Expected Output

- Terraform initializes and validates configurations
- Plan output shows intended changes (resources to be added)
- Apply provisions infrastructure on AWS
- Console output displays provisioning logs and status

---

## Technologies Used

- Jenkins – CI/CD automation
- Terraform – Infrastructure as Code
- AWS – EC2, VPC, and Security Groups
- Git/GitHub – Version control


