# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "environment" {
  type = string
  default     = "dev"
}

variable "region" {
  type = string
  default     = "us-east-2"
}

variable "cluster_version" {
  type = string
  default     = "1.31"
}

variable "instance_type" {
  type = string
  default     = "t3.small"

}

