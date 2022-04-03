resource "aws_ecr_repository" "p6-nginx" {
  name                 = var.ecr-repo-nginx
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "p6-front" {
  name                 = var.ecr-repo-front
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}