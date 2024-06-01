variable "domain_zone_id" {
    description = "Route53 Zone ID of Domain."
    type = string
}

variable "domain_name" {
    description = "Domain Name of SSL Certificate."
    type = string
}

variable "environment" {
    description         = "Environment the ECS Cluster is being deployed to"
    type                = string
}