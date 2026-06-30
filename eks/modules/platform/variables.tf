variable "environment" {
  type = string
  description = "Deployment environment name"

  validation {
    condition     = contains(["dev", "test", "stage", "perf", "prod"], var.environment)
    error_message = "Environment must be one of: dev, test, stage, perf, prod."
  }
}

variable "region" {
  type = string
  description = "AWS region for deployment"

  validation {
    condition     = can(regex("^[a-z]{2}-[a-z]+-[0-9]+$", var.region))
    error_message = "Region must match AWS region format, e.g., us-east-1, ap-southeast-2."
  }
}

variable "cluster_version" {
  type = string
  description = "EKS Kubernetes version"

  validation {
    condition     = can(regex("^1\\.[0-9]+$", var.cluster_version))
    error_message = "Cluster version must match format 1.xx (e.g., 1.29, 1.30, 1.31)."
  }
}

variable "instance_type" {
  type = string
  description = "EC2 instance type for node group"

  validation {
    condition     = can(regex("^t3\\.(small|medium|large)$", var.instance_type))
    error_message = "Instance type must be one of: t3.small, t3.medium, t3.large."
  }
}
