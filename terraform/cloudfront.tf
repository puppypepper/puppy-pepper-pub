resource "aws_cloudfront_distribution" "p6-cf" {
  aliases = ["${var.root_domain}"]

  origin {
    domain_name = var.cloudfront_origin_domain
    origin_id   = var.cloudfront_origin_domain

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1"]
    }
  }

  enabled = true

  default_cache_behavior {
    allowed_methods  = ["HEAD", "GET"]
    cached_methods   = ["HEAD", "GET"]
    target_origin_id = var.cloudfront_origin_domain

    forwarded_values {
      query_string = true

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"

    min_ttl     = 0
    default_ttl = 1800
    max_ttl     = 3600
    compress    = true
  }

  price_class = "PriceClass_100"

  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = ["JP"]
    }
  }

  viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate.cert_static.arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1"
  }
}
