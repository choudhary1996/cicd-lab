📦 Node.js CI/CD with GitHub Actions & AWS EC2
OverView: This project demonstrates a complete CI/CD pipeline for a Node.js application using GitHub Actions and deployment to an AWS EC2 instance.

🚀 Key Features
✅ CI/CD with GitHub Actions Automates the build and deployment process for a Node.js app.

🔐 Environment Variables Managed in AWS SSM Parameter Store Securely stores environment configurations without hardcoding secrets.

🔧 Build Automation The application is built using GitHub Actions workflows.

☁️ Artifacts Uploaded to Amazon S3 Build outputs are zipped and uploaded to an S3 bucket for deployment.

📦 Deployment with AWS CodeDeploy CodeDeploy handles deploying the application from S3 to EC2 instances.

🔒 No Hardcoded AWS Credentials GitHub is granted access to AWS via OIDC (OpenID Connect) — no need to use AWS_ACCESS_KEY or AWS_SECRET_ACCESS_KEY.


**Step 1:**
✅ 1. Create IAM Role with Web Identity Trust
a. Go to AWS Console
Navigate to IAM > Roles > Create role

Choose:

Trusted entity type: Web identity

Identity provider: token.actions.githubusercontent.com

✅ 2. Create IAM Role with Web Identity Trust
a. Go to AWS Console
Navigate to IAM > Roles > Create role

Choose:

Trusted entity type: Web identity

Identity provider: token.actions.githubusercontent.com
Audience (client ID): sts.amazonaws.com

✅ 3. Add Trust Policy (GitHub OIDC)

✅ 4. Attach IAM Policies (Temporary: Full Access for Testing)
AmazonS3FullAccess

AmazonEC2FullAccess

AmazonSSMFullAccess

AmazonEC2InstanceConnect

AmazonSSMReadOnlyAccess

AmazonCodeDeployFullAccess

AmazonSSMFullAccess
Later, replace these with least-privilege custom policies.

✅ 4. GitHub Actions Workflow: OIDC Setup + AWS Deploy
.github/workflows/deploy.yml check file

