resource "aws_route53_record" "api_A_record" {
   zone_id                        = var.domain_zone_id
   name                           = "api.${var.domain_name}"
   type                           = "A"
   alias {
     name                         = aws_alb.main.dns_name
     zone_id                      = aws_alb.main.zone_id
     evaluate_target_health       = true
   }
}
