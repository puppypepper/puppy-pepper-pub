data "aws_route53_zone" "route53-zone" {
  name         = "puppy-pepper.net"
  private_zone = false
}

resource "aws_route53_record" "root_record" {
  zone_id = data.aws_route53_zone.route53-zone.zone_id
  name    = var.root_domain
  type    = "A"
  ttl     = "60"
  records = [aws_lightsail_static_ip.static_ip.ip_address]
}

resource "aws_route53_record" "cert_static_validation" {
  for_each = {
    for dvo in aws_acm_certificate.cert_static.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

 zone_id         = data.aws_route53_zone.route53-zone.zone_id
  name            = each.value.name
  type            = each.value.type
  records         = [each.value.record]
  ttl             = 60
  allow_overwrite = true
}