# 🚀 C++ CI/CD Pipeline

This repository demonstrates a **complete, reusable, and production-style CI/CD pipeline** for a **C++ application** using:

* **CMake** for builds
* **GitHub Actions** for CI/CD
* **Docker** for packaging
* **AWS ECR** for container registry
* **Artifact-based deployment** (build once, deploy many)


---

## 📌 What This Project Covers

* ✅ Clean C++ project structure
* ✅ Out-of-source builds with CMake
* ✅ CI pipeline (build, test, artifact storage)
* ✅ CD pipeline (reuse artifact, Dockerize, push to ECR)
* ✅ Separation of CI and CD
* ✅ Reusable GitHub workflows
* ✅ Stage-wise deployment readiness
* ✅ No rebuild drift (immutable artifacts)


## 🧱 Repository Structure

```
.
└── .github/
    └── workflows/
        ├── ci.yml
        ├── cd-ed.yml
        └── main.yml


## 🔄 CI/CD Flow (High Level)

Code Push
   ↓
CI:
  - Checkout code
  - Build C++ (CMake)
  - Run tests
  - Upload build artifact
   ↓
CD:
  - Download artifact
  - Build Docker image
  - Push image to AWS ECR

✔ Build happens **once**
✔ Same artifact is reused across environments

---

## ⚙️ CI – Continuous Integration

### What CI does:

* Uses Ubuntu GitHub runner
* Installs build dependencies
* Configures and builds with CMake
* Runs tests using CTest
* Uploads compiled binaries as artifacts

📄 Workflow file:

```
.github/workflows/ci.yml
```

---

## 🚀 CD – Continuous Deployment

### What CD does:

* Downloads artifact produced by CI
* Builds Docker image using that artifact
* Authenticates to AWS
* Pushes image to Amazon ECR

📄 Workflow file:

```
.github/workflows/cd.yml
```

---

## 🐳 Docker Strategy (Important)

* Docker **does NOT compile** the code
* Docker only **packages the binary built in CI**
* This ensures:

  * Faster deployments
  * Immutable artifacts
  * No environment drift

```dockerfile
COPY build/<app_name> /app/<app_name>
ENTRYPOINT ["./<app_name>"]
```

---

## 🔐 Secrets Required (GitHub)

Add the following secrets in
**GitHub → Settings → Secrets → Actions**

| Secret Name           |
| --------------------- |
| AWS_ACCESS_KEY_ID     |
| AWS_SECRET_ACCESS_KEY |
| AWS_ACCOUNT_ID        |

> IAM user should have **ECR push permissions only**

---
🚧 Deployment Status & Roadmap

Current State:
This project currently deploys container images to AWS Elastic Container Registry (ECR) as part of the CI/CD pipeline.

Upcoming Enhancements:
Additional deployment targets will be added in future iterations, including:

AWS ECS (Fargate) – managed container orchestration

AWS EKS – Kubernetes-based deployment

Standalone Docker Container – VM / EC2-based deployment

## 🙌 Acknowledgement

Built as part of my DevOps Engineering learning journey.

---

### ⭐ If you’re reviewing this repo

Feedback and suggestions are always welcome.
