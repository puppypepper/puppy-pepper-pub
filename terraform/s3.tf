resource "aws_s3_bucket" "article-bucket" {
  bucket_prefix = "p6-article-bucket"
  acl = "private"
}
