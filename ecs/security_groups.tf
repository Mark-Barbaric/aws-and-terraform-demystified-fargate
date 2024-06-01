
resource "aws_security_group" "ecs_sg" {
    name                        = "${var.name}_${var.environment}_ecs_security_group"
    description                 = "Security Group for ECS Service"
    vpc_id                      = var.vpc_id

    tags = {
      name                      = "${var.name}_${var.environment}_ecs_security_group"
      terraform                 = true
      environment               = var.environment
    }
}