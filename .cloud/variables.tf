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