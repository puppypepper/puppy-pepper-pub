variable "root_domain" {
  default = "puppy-pepper.net"
}

variable "cloudfront_origin_domain" {
  default = "ls.puppy-pepper.net"
}

variable "api_domain" {
  default = "api.puppy-pepper.net"
}

variable "ecr-repo-nginx" {
  default = "p6-nginx"
}

variable "ecr-repo-front" {
  default = "p6-front"
}