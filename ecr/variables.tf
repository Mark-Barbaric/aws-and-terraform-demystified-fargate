variable "region" {
  description           = "AWS Region for the service"
  type                  = string
}

variable "name" {
    description         = "Name of the ECR Repository"
    type                = string
}

variable "max_image_count" {
    description         = "Max amount of images to be kept in lifecyle policy"
    type                = number
}

variable "environment" {
    description         = "Environment the ECR Repository is being deployed to"
    type                = string
}