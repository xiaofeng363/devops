
# 🚀 DevOps Platform on AWS EKS

This repository demonstrates a DevOps platform built on AWS EKS, leveraging:

* Kubernetes (EKS)
* Helm (multi-environment deployment)
* GitHub Actions for CI
* Argo CD for CD
* AWS ECR for container image storage
* ALB Ingress Controller
* Horizontal Pod Autoscaler (HPA)
***

# 📊 1. Application Design (Logical Architecture)

<img width="761" height="262" alt="image" src="https://github.com/user-attachments/assets/9bdfe2fb-a0f5-4ef2-94f5-ba5689f2739e" />


## Description

* Ingress: Entry point for external traffic
* Service: Internal load balancing
* Pods: Application instances
* HPA: Auto-scaling based on metrics

***

# ☁️ 2. Infrastructure Design (AWS EKS)

<img width="760" height="336" alt="image" src="https://github.com/user-attachments/assets/19fd9a8a-64ac-4c0e-9d35-c80687c57195" />


## Description

* EKS Control Plane is fully managed by AWS
* Worker nodes run in private subnets
* ALB provides external access
* Multi-AZ ensures high availability

***

# 🔄 3. Pipeline Design (CI/CD)
<img width="291" height="558" alt="image" src="https://github.com/user-attachments/assets/e33717c1-a13b-4b2b-967b-919d10e8ca1b" />


## Description

* CI/CD fully automated via GitHub Actions and Argocd
* Docker image built and pushed to ECR
* Helm manages service yamls
* Kubernetes performs rolling update
* HPA scales Pods dynamically

***

# ⚙️ 4. Installation & Quick Start

## 🔹 Prerequisites

* AWS CLI configured
* kubectl installed
* Helm installed
* Terraform installed

***

## 🔹 Step 1: Provision Infrastructure (EKS)

```bash
cd eks/env/<environment>

# Example:
cd eks/env/dev
# or
cd eks/env/prod

terraform init
terraform apply
```

***

## 🔹 Step 2: Configure kubectl

```bash
aws eks update-kubeconfig \
  --region <region> \
  --name <cluster-name>
```

***

## 🔹 Step 3: Deploy Application with Helm

### Dev Environment

```bash
helm install devstack . \
  -f values.yaml \
  -f values-dev.yaml \
  -n dev \
  --create-namespace
```

***

### Production Environment

```bash
helm install prodstack . \
  -f values.yaml \
  -f values-prod.yaml \
  -n prod
```

***

## 🔹 Step 4: Verify Deployment

```bash
kubectl get pods -n dev
kubectl get svc -n dev
kubectl get ingress -n dev
```

***

## 🔹 Step 5: Access Application

```bash
kubectl get ingress -n dev
```

Open the ALB endpoint in browser.

***


# ✅ Future Improvements

```markdown
- [ ] GitOps integration (ArgoCD)
- [ ] Canary / Blue-Green deployment
- [ ] Prometheus + Grafana monitoring
- [ ] Centralized logging (ELK / OpenSearch)
- [ ] Combine HPA + VPA scaling
- [ ] Replace with other images to provide more services
- [ ] Introduce AI agent as service
```
