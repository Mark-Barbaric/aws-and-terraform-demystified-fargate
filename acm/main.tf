resource "aws_acm_certificate" "domain_certificate" {
    domain_name                             = var.domain_name
    subject_alternative_names               = ["*.${var.domain_name}"]
    validation_method                       = "DNS"
    tags                                    = {
        name                                = var.domain_name
        environment                         = var.environment
        terraform                           = true
    }

    lifecycle {
        create_before_destroy               = true
    }
}

resource "aws_route53_record" "domain_validation_entry" {
    allow_overwrite                         = true
    name                                    = tolist(aws_acm_certificate.domain_certificate.domain_validation_options)[0].resource_record_name
    records                                 = [ tolist(aws_acm_certificate.domain_certificate.domain_validation_options)[0].resource_record_value ]
    type                                    = tolist(aws_acm_certificate.domain_certificate.domain_validation_options)[0].resource_record_type
    zone_id                                 = var.domain_zone_id
    ttl                                     = 60
}

resource "aws_acm_certificate_validation" "domain_certificate_validation" {
    certificate_arn                         = aws_acm_certificate.domain_certificate.arn
    validation_record_fqdns                 = [ aws_route53_record.domain_validation_entry.fqdn ]
}
