resource "aws_security_group_rule" "ecs_app_ingress" {
    type                        = "ingress"
    from_port                   = var.app_port
    to_port                     = var.app_port
    protocol                    = "-1"
    cidr_blocks                 = ["0.0.0.0/0"]
    security_group_id           = aws_security_group.ecs_sg.id
}

resource "aws_security_group_rule" "ecs_egress" {
    type                        = "egress"
    from_port                   = 0
    to_port                     = 0
    protocol                    = "-1"
    cidr_blocks                 = ["0.0.0.0/0"]
    security_group_id           = aws_security_group.ecs_sg.id
}