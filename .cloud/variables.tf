## ---- Azure

variable "azure_subscription_id" {
  type        = string
  description = "Azure Subscription Id"
}

variable "azure_client_id" {
  type        = string
  description = "Azure Client Id/appId"
}

variable "azure_client_secret" {
  type        = string
  description = "Azure Client Id/appId"
}

variable "azure_tenant_id" {
  type        = string
  description = "Azure Tenant Id"
}

## ---- GCP

variable "gcp_project_id" {
  type        = string
  description = "GCP Project ID"
}

variable "gcp_region" {
  default = "us-east1"
}

variable "gcp_billing_account_id" {
  type = string
  description = "GCP billing account ID"
}

## ---- General

variable "root_domain" {
  type        = string
  description = "Root Domain for hosting services"
}

variable "short_prefix" {
  type    = string
  default = "jcx"
}

variable "email_address" {
  type        = string
  description = "Email Address"
}

variable "admin_password" {
  type        = string
  description = "Admin Password"
}