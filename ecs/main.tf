resource "aws_ecs_cluster" "main" {
    name                            = "${var.name}_ecs_cluster_${var.environment}"
}

resource "aws_ecs_task_definition" "main" {
    network_mode                    = "awsvpc"
    family                          = "${var.name}_ecs_task_${var.environment}"
    requires_compatibilities        = ["FARGATE"]
    cpu                             = 256
    memory                          = 512
    execution_role_arn              = "${aws_iam_role.ecs_task_execution_role.arn}"
    container_definitions           = jsonencode([{
        name                        = "${var.container_name}"
        image                       = "${var.container_image}:${var.container_version}"
        essential                   = true
        portMappings                = [{
            protocol                = "tcp"
            containerPort           = var.container_port
            hostPort                = var.app_port
        }]
        logConfiguration            = {
            logDriver               = "awslogs"
            options                 = {
                awslogs-group               = "${aws_cloudwatch_log_group.main.name}"
                awslogs-region              = "${var.region}"
                awslogs-stream-prefix       = "ecs_${var.name}_${var.environment}"
            }
        }
    }])
}

resource "aws_ecs_service" "main" {
    name                               = "${var.name}_ecs_service_${var.environment}"
    cluster                            = aws_ecs_cluster.main.id
    task_definition                    = aws_ecs_task_definition.main.arn
    desired_count                      = 2
    deployment_minimum_healthy_percent = 50
    deployment_maximum_percent         = 200
    launch_type                        = "FARGATE"
    scheduling_strategy                = "REPLICA"
 
    network_configuration {
        security_groups                 = aws_security_group.ecs_sg[*].id
        subnets                         = var.subnets[*]
        assign_public_ip                = false
    }
 
    load_balancer {
        target_group_arn                = var.alb_target_group_arn
        container_name                  = "${var.container_name}"
        container_port                  = var.container_port
    }
 
    lifecycle {
        ignore_changes = [task_definition, desired_count]
    }

    tags = {
        name = "${var.name}_${var.environment}_ecs_service"
        terraform = true
        environment = var.environment
    }
}