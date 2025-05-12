## 📦 Node.js CI/CD with GitHub Actions & AWS EC2

**OverView:**
This project demonstrates a complete CI/CD pipeline for a Node.js application using **GitHub Actions** and deployment to an **AWS EC2 instance**.

### 🚀 Key Features

* ✅ **CI/CD with GitHub Actions**
  Automates the build and deployment process for a Node.js app.

* 🔐 **Environment Variables Managed in AWS SSM Parameter Store**
  Securely stores environment configurations without hardcoding secrets.

* 🔧 **Build Automation**
  The application is built using GitHub Actions workflows.

* ☁️ **Artifacts Uploaded to Amazon S3**
  Build outputs are zipped and uploaded to an S3 bucket for deployment.

* 📦 **Deployment with AWS CodeDeploy**
  CodeDeploy handles deploying the application from S3 to EC2 instances.

* 🔒 **No Hardcoded AWS Credentials**
  GitHub is granted access to AWS via **OIDC (OpenID Connect)** — no need to use `AWS_ACCESS_KEY` or `AWS_SECRET_ACCESS_KEY`.
