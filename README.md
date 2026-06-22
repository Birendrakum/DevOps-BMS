# CI/CD Pipeline with Jenkins, Terraform, Amazon EKS, Docker, Prometheus, and Grafana

## 📌 Project Overview

This project demonstrates an end-to-end DevOps CI/CD pipeline that automates infrastructure provisioning, application deployment, and monitoring on AWS.

The solution uses **Terraform** to provision AWS infrastructure, **Jenkins** to orchestrate the CI/CD workflow, **Docker** for containerization, and **Amazon EKS (Elastic Kubernetes Service)** for container orchestration. A dedicated monitoring stack consisting of **Prometheus**, **Grafana**, and **Node Exporter** is used to monitor the Jenkins server.

## 🏗️ Architecture

```
                        GitHub Repository
                               │
                               ▼
                        Jenkins Pipeline
                               │
        ┌──────────────────────┼──────────────────────┐
        │                      │                      │
        ▼                      ▼                      ▼
  Static Analysis      Security Scanning      Docker Build & Push
  (SonarQube)          (Trivy, OWASP DC)      (Docker Hub/ECR)
        │
        ▼
Terraform provisions Amazon EKS
        │
        ▼
Configure kubeconfig
        │
        ▼
Deploy Kubernetes Manifests
        │
        ▼
Amazon EKS Cluster
        │
        ▼
Application Pods & Services

Monitoring:
Node Exporter → Prometheus → Grafana
```

## 🚀 Features

* Infrastructure provisioning using Terraform
* Automated Jenkins pipeline for CI/CD
* Docker image build and registry push
* Amazon EKS cluster deployment
* Kubernetes application deployment
* SonarQube code quality analysis
* OWASP Dependency-Check integration
* Trivy vulnerability scanning
* Jenkins server monitoring using Prometheus, Grafana, and Node Exporter
* IAM roles and security groups managed through Infrastructure as Code

## 🛠️ Technologies Used

* AWS EC2
* Amazon EKS
* Amazon VPC
* Terraform
* Jenkins
* Docker
* Kubernetes
* kubectl
* Prometheus
* Grafana
* Node Exporter
* SonarQube
* Trivy
* OWASP Dependency-Check
* Git & GitHub

## 📂 Infrastructure Components

### Main Infrastructure

* Custom VPC
* Public subnet for Jenkins
* Private subnet for monitoring
* Private subnets for EKS worker nodes
* Internet Gateway
* NAT Gateway
* Route Tables
* IAM Roles
* Security Groups
* EC2 instances

### Kubernetes Infrastructure

* Amazon EKS Cluster
* Managed Node Group
* Kubernetes Deployment
* Kubernetes Service

## 🔄 Jenkins Pipeline Stages

1. Checkout source code
2. Install project dependencies
3. Run SonarQube analysis
4. Wait for quality gate
5. Execute OWASP Dependency-Check
6. Perform Trivy security scan
7. Build Docker image
8. Push Docker image to registry
9. Deploy EKS infrastructure with Terraform
10. Configure kubeconfig
11. Deploy Kubernetes resources
12. Verify application deployment

## 📊 Monitoring

The Jenkins server is monitored using:

* Node Exporter for host-level metrics
* Prometheus for metrics collection
* Grafana dashboards for visualization

Metrics include:

* CPU utilization
* Memory usage
* Disk usage
* Network statistics
* System load

## 🔐 Security Practices

* IAM roles for AWS resource access
* Infrastructure managed through Terraform
* Static code analysis using SonarQube
* Dependency vulnerability scanning using OWASP Dependency-Check
* Container image scanning using Trivy
* Private subnets for Kubernetes worker nodes

## 📈 Future Enhancements

* Helm-based application deployments
* GitOps with Argo CD
* AWS Load Balancer Controller
* ExternalDNS integration
* Horizontal Pod Autoscaler
* Blue/Green or Canary deployments
* Remote Terraform state backend with locking
* Automated rollback strategy

## 🎯 Learning Outcomes

* Infrastructure as Code with Terraform
* CI/CD automation using Jenkins
* Kubernetes application lifecycle management
* AWS networking and IAM configuration
* Containerization with Docker
* DevSecOps practices through automated scanning
* Monitoring and observability using Prometheus and Grafana
* End-to-end deployment automation on AWS
