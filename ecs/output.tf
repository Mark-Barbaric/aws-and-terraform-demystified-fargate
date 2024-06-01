output "ecs_service_output" {
    description                 = "Output for ECS Service Module."
    value                       = { name : aws_ecs_service.main.name, 
                                    security_group_id : aws_security_group.ecs_sg.id
                                    ecs_cluster_name : aws_ecs_cluster.main.name
                                    ecs_service_name : aws_ecs_service.main.name }
}