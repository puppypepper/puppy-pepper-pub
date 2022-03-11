resource "aws_acm_certificate" "cert_static" {
  provider          = aws.virginia
  domain_name       = var.root_domain
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "cert_static" {
  provider                = aws.virginia
  certificate_arn         = aws_acm_certificate.cert_static.arn
  validation_record_fqdns = [for record in aws_route53_record.cert_static_validation : record.fqdn]
}