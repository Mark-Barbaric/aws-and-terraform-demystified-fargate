output "acm_ssl_certificate_arn" {
    description = "ARN ID of ACM SSL Certificate"
    value = aws_acm_certificate.domain_certificate.arn
}