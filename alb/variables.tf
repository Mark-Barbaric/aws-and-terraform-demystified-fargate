variable "region" {
  description           = "AWS Region for the ECS Cluser"
  type                  = string
}

variable "name" {
    description         = "Name of the ECS Cluster"
    type                = string
}

variable "subnets" {
    description         = "List of ARNs for Subnets the ALB belongs within."
    type                = list(string)
}

variable "vpc_id" {
    description         = "ARN for VPC ALB belongs to."
    type                = string
}

variable "health_check_path" {
    description         = "REST Endpoint used to healthcheck."
    type                = string
}

variable "alb_tls_cert_arn" {
    description         = "ARN for the tls cert used for HTTPS."
    type                = string
}

variable "domain_name" {
    description         = "Domain Name for the ALB."
    type                = string
}

variable "domain_zone_id" {
    description         = "Domain Zone ID Domain Name belongs to."
    type                = string
}

variable "ecs_cluster_name" {
    description         = "Name of the ECS Cluster."
    type                = string
}

variable "ecs_service_name" {
    description         = "Name of ECS Service."
    type                = string
}

variable "auto_scaling_max_target" {
    description         = "Max nodes for auto scaling"
    type                = number
}

variable "environment" {
    description         = "Environment the ECS Cluster is being deployed to"
    type                = string
}