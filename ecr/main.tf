resource "aws_ecr_repository" "main" {
    name                        = "${var.name}"
    image_tag_mutability        = "MUTABLE"

    tags                        = {
        Name                        = var.name
        environment                 = var.environment
        terraform                   = true
    }
}

resource "aws_ecr_lifecycle_policy" "main" {
    repository                  = aws_ecr_repository.main.name
    policy                      = jsonencode({
        rules                   = [{
            rulePriority        = 1
            description         = "Keep last ${var.max_image_count} images"
            action              = {
                type            = "expire"
            }
            selection           = {
                tagStatus       = "any"
                countType       = "imageCountMoreThan"
                countNumber     = var.max_image_count
            }
        }]
    })
}