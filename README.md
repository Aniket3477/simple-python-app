# 🛡️ End-to-End Automated DevSecOps Pipeline

![Jenkins](https://img.shields.io/badge/Jenkins-D24939?style=for-the-badge&logo=Jenkins&logoColor=white)
![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
![SonarCloud](https://img.shields.io/badge/SonarCloud-F37032?style=for-the-badge&logo=SonarCloud&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)

## 📌 Project Overview
Developed a production-grade **DevSecOps CI/CD Pipeline** that automates Infrastructure provisioning, Security Auditing, and Containerized Deployment. The project focuses on **"Shift-Left Security"**, ensuring every code change is scanned for vulnerabilities before reaching production.

---

## 🏗️ Pipeline Architecture
The pipeline follows a strict security-first workflow:
1. **Source:** Code push to GitHub triggers Jenkins via **Webhooks**.
2. **Static Analysis (SAST):** **SonarCloud** scans for bugs and security hotspots (**Grade A Achieved**).
3. **Infrastructure Audit:** **Tfsec** scans Terraform files for cloud misconfigurations.
4. **Build & Scan:** **Docker** image built using **Alpine Linux** and scanned by **Trivy** (Zero Vulnerabilities).
5. **Deployment:** Secure deployment to **AWS EC2** with restricted network access.

---

## 🛠️ Tech Stack & Security Tools
| Stage | Tool | Purpose |
| :--- | :--- | :--- |
| **Orchestration** | **Jenkins** | Automation of the entire CI/CD lifecycle. |
| **Provisioning** | **Terraform** | Infrastructure as Code (IaC) for AWS resources. |
| **SAST** | **SonarCloud** | Deep code analysis for security and reliability. |
| **IaC Scanning** | **Tfsec** | Scanning for IMDSv2, Encryption, and Egress gaps. |
| **Container Scan** | **Trivy** | Vulnerability detection in Docker images. |
| **Runtime** | **Docker** | Lightweight and secure Alpine-based containers. |
| **Cloud** | **AWS** | EC2, Security Groups, and EBS Encryption. |

---

## 🏆 Security Milestones Achieved
- **Zero Vulnerabilities:** Successfully reduced container vulnerabilities from **120+ to 0** by migrating to Alpine-based images.
- **Infrastructure Hardening:** Enforced **IMDSv2**, Root Volume Encryption, and Restricted Egress rules (Passed 100% Tfsec checks).
- **Code Quality:** Maintained **Grade A** across Reliability, Security, and Maintainability on SonarCloud.
- **Network Security:** Restricted SSH and Jenkins access to specific personal IP ranges.

---

## 📖 How to Deploy
1. **Clone the Repo:**
   ```bash
   git clone [https://github.com/Aniket3477/simple-python-app.git](https://github.com/Aniket3477/simple-python-app.git)

## 📖 How to Run
### 1. Infrastructure Setup
```bash
git clone [https://github.com/Aniket3477/simple-python-app.git](https://github.com/Aniket3477/simple-python-app.git)
cd simple-python-app
terraform init
terraform apply -auto-approve

Trigger Pipeline:
Push any changes to the main branch to trigger the automated Jenkins build.








### 👨‍💻 Developed By

| Name | Degree | Profiles |
| :--- | :--- | :--- |
| **Aniket Saini** | B.Tech CSE (Cloud Technology & Information Security) | [LinkedIn](http://www.linkedin.com/in/aniket-saini-777cloudtech) | [GitHub](https://github.com/Aniket3477) |

---
