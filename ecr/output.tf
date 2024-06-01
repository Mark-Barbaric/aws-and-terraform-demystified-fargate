output "ecr_repository_output" {
    description             = "ARN ID and repository_url of ecr_repository"
    value                   = { "arn" : aws_ecr_repository.main.arn, "repository_url" : aws_ecr_repository.main.repository_url, "full_container_name" : aws_ecr_repository.main.name }
}