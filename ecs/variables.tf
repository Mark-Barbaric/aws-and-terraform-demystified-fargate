variable "region" {
  description           = "AWS Region for the ECS Cluser"
  type                  = string
}

variable "name" {
    description         = "Name of the ECS Cluster"
    type                = string
}

variable "container_name" {
    description         = "Name of the container being used for service."
    type                = string
}

variable "container_image" {
    description         = "Full ecr url to the container image being used."
    type                = string
}

variable "container_version" {
    description         = "Version of the container_image to be used."
    type                = string
}

variable "container_port" {
    description         = "Container port being assigned to the ECS Service."
    type                = number
}

variable "app_port" {
    description         = "Port the underling app uses."
    type                = number
}

variable "vpc_id" {
    description         = "ARN for the VPC."
    type                = string
}

variable "subnets" {
    description         = "IDs of the Subnets the ECS Service belongs in."
    type                = list(string)
}

variable "alb_target_group_arn" {
    description         = "ARN of the ALB Target Group."
    type                = string
}

variable "database_role_policy" {
    description         = "Database policy being applied to the ECS IAM Role Policy."
    type                = any
}

variable "environment" {
    description         = "Environment the ECS Cluster is being deployed to"
    type                = string
}