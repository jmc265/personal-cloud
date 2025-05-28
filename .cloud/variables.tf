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

## ---- NR

variable "newrelic_account_id" {
  type = string
  description = "New Relic account ID"
}

variable "newrelic_api_key" {
  type = string
  description = "New Relic api key"
}

variable "newrelic_license_key" {
  type = string
  description = "New Relic license key"
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