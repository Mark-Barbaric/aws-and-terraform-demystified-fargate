resource "aws_security_group" "alb_sg" {
  name                          = "${var.name}_${var.environment}_ecs_lb_security_group"
  description                   = "Security Group for the alb."
  vpc_id                        = var.vpc_id

  tags = {
    Name                        = "${var.name}_${var.environment}_ecs_lb_security_group"
    terraform                   = true
    environment                 = var.environment
  }
}
