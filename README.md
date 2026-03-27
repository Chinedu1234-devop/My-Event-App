## Scalable Web Application Deployment on AWS 

This project demonstrates how to design, provision, and deploy a scalable web application on AWS using modern DevOps practices including Infrastructure as Code, CI/CD pipelines, and containerization.

## Project Overview
The goal of this project is to automate the deployment of a web application using:
•	Terraform for infrastructure provisioning
•	AWS EC2 for compute resources
•	Jenkins for CI/CD automation
•	Docker for containerization
The application is built, packaged, and deployed automatically through a Jenkins pipeline.

## Architecture
•	Jenkins Server (CI/CD) 
•	Application Server (Dockerized app) 
•	AWS EC2 Instances 
•	Security Groups for controlled access 
•	Docker Hub (Image Registry)

## Technologies Used
•	AWS (EC2, Security Groups) 
•	Terraform (Infrastructure as Code) 
•	Jenkins (CI/CD) 
•	Docker (Containerization) 
•	GitHub (Source Code Management) 
•	Linux (Amazon Linux )

## Features
•	Automated infrastructure provisioning using Terraform 
•	Fully functional CI/CD pipeline using Jenkins 
•	Dockized application deployment 
•	Secure networking configuration 
•	Repeatable and scalable setup

## Project Structure
├── terraform/
│   ├── Jenkins_server/
│   ├── Application_server/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
│
├── app/
│   ├── Dockerfile
│   ├── requirements.txt
│   └── application code
│
├── Jenkinsfile
└── README.md

## Setup Instructions
## 1.Clone the Repository 
git clone https://github.com/your-username/your-repo.git
cd your-repo

## 2.Provision Infrastructure with Terraform
cd terraform
terraform init
terraform apply

## 3.Access Jenkins
Open browser:
http://<jenkins-public-ip>:8080
Retrieve admin password:
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

## 4.Configure Jenkins
•	Install suggested plugins 
•	Create admin user 
•	Set Jenkins URL

## 5.Configure CI/CD Pipeline
•	Create a new pipeline job 
•	Connect to your GitHub repository 
•	Use the provided Jenkinsfile

## 6.Pipeline Stages
The pipeline performs:
1.	Checkout Code from GitHub 
2.	Build Docker Image 
3.	Login to Docker Hub 
4.	Push Image to Docker Hub 
5.	Deploy to Application Server

## 7.Access Application
http://<application-server-public-ip>:5000

## Security Configuration
•	Port 22 → SSH access 
•	Port 80 → Web traffic 
•	Port 8080 → Jenkins 
•	Port 5000 → Application

## Project Outcome
•	Fully automated CI/CD pipeline 
•	Scalable infrastructure using Terraform 
•	Containerized application deployment 
•	Real-world DevOps workflow implementation

## Conclusion
This project demonstrates how DevOps practices enable faster, reliable, and scalable application deployments. 
By combining infrastructure automation, CI/CD pipelines, and containerization, we achieve a production-ready deployment workflow.





