# Jenkins-Terraform-CICD Pipeline for AWS EC2 Deployment

## Project Overview
This project automates AWS infrastructure provisioning using **Jenkins** and **Terraform**. It sets up an EC2 instance within a custom VPC, utilizing Terraform to create the required **VPC, security groups, and EC2 instances**. The Jenkins pipeline integrates with Terraform to handle `init`, `plan`, `apply`, and `destroy` actions.

### Features & Workflow
- **Automated Terraform Deployment** via Jenkins
- **Parameterized Pipeline** (`TAG_NAME`, `INSTANCE_COUNT`, `TERRAFORM_ACTION`)
- **Supports `init`, `plan`, `apply`, and `destroy` Actions**
- **Creates a Custom VPC and Security Group**
- **Deploys EC2 instances with customizable parameters**
- **Dynamic Tag Names (`Server_dev`, `Server_test`, `Server_prod`)**
- **Default instance count set to 5 (configurable in Jenkins)**

---
## Project Structure
```
Jenkins_Terraform_CICD/
├── ec2/                  # Terraform directory (contains Terraform config files)
├── Jenkinsfile            # Jenkins pipeline script
├── main.tf                # Terraform main configuration file
├── variables.tf           # Terraform variables file
├── README.md              # This documentation file
```

---
## Setup Instructions

### Prerequisites
- AWS account with permissions to create EC2 instances
- Jenkins installed with required plugins (**Git, Terraform, Pipeline**)
- Terraform installed (`terraform --version`)
- GitHub repository containing the Jenkinsfile & Terraform files

### Terraform Configuration Details
#### Infrastructure Components
- **VPC**: Custom VPC with CIDR block `172.31.0.0/16`
- **Security Group**: Allows inbound traffic on ports `8080` (Jenkins) and `3389` (RDP)
- **EC2 Instances**: Configurable count (default is 5), key pair, instance type
- **Dynamic Tagging**: Supports tag names `Server_dev`, `Server_test`, and `Server_prod`

### How to Set Up Jenkins Pipeline

#### 1. Install Jenkins and Plugins
```sh
sudo apt update && sudo apt install jenkins -y
```
- Install **Terraform Plugin** in Jenkins
- Install **Git Plugin** in Jenkins

#### 2. Clone the Repository
```sh
git clone https://github.com/YOUR_USERNAME/Jenkins-Terraform-CICD.git
```

#### 3. Create a New Jenkins Pipeline Job
- Select **Pipeline** type.
- Set **GitHub Repository URL**.
- Choose **Pipeline from SCM** and link `Jenkinsfile`.

#### 4. Run the Pipeline
- Click **Build with Parameters**.
- Select values:
  - **TAG_NAME:** `Server_dev`, `Server_test`, or `Server_prod`
  - **TERRAFORM_ACTION:** `init & plan` or `apply`
  - **INSTANCE_COUNT:** `5` (default) or other selectable values
- Click **Build**.

---
## Expected Output
- Terraform initializes successfully.
- Terraform plan shows EC2 instances to be created.
- Terraform apply provisions AWS infrastructure.
- Jenkins console logs display the success message.

---
## Technologies Used
- Jenkins (CI/CD Automation)
- Terraform (Infrastructure as Code)
- AWS EC2 (Cloud Deployment)
- AWS VPC & Security Groups
- Git & GitHub (Version Control)

---
## License
---
## Contact


