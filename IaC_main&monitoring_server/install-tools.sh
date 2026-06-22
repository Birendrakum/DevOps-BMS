#!/bin/bash
yum update -y

# Docker
amazon-linux-extras enable docker
yum install -y docker
systemctl start docker
systemctl enable docker

# Jenkins + Java
amazon-linux-extras install java-openjdk11 -y
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum install -y jenkins
systemctl start jenkins
systemctl enable jenkins

# Node.js
curl -sL https://rpm.nodesource.com/setup_18.x | bash -
yum install -y nodejs

# kubectl
curl -o /usr/local/bin/kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.29.0/2024-01-04/bin/linux/amd64/kubectl
chmod +x /usr/local/bin/kubectl

# Terraform
curl -fsSL https://releases.hashicorp.com/terraform/1.7.5/terraform_1.7.5_linux_amd64.zip -o terraform.zip
unzip terraform.zip
mv terraform /usr/local/bin/
rm terraform.zip

# Git
yum install -y git

# Java 17
yum install -y java-17-amazon-corretto

# Trivy
curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh
mv trivy /usr/local/bin/

# OWASP Dependency-Check
mkdir -p /opt/owasp
curl -L https://github.com/jeremylong/Here’s how you can extend your Terraform setup so the **main EC2 server** runs inside its own dedicated VPC with all networking components. I’ll show you a clean modular structure:

# SonarQube via Docker
echo "Deploying SonarQube in Docker..."
docker run -d \
  --name sonarqube \
  -p 9000:9000 \
  sonarqube:latest

---

## 🔹 `provider.tf`
```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.5.0"
}

provider "aws" {
  region = "us-east-1"
}
