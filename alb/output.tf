output "alb_output" {
    description             = "Output from the ALB Module."
    value                   = {
                                name : aws_alb.main.name,
                                id : aws_alb.main.id,
                                target_group_id : aws_alb_target_group.main.id,
                                public_dns : aws_alb.main.dns_name
                                zone_id : aws_alb.main.zone_id
    }
}