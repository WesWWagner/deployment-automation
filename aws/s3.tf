resource "aws_s3_bucket" "si" {
  count  = var.si_enabled ? 1 : 0
  bucket = local.si_bucket_name
  tags   = local.instance_tags
}

resource "aws_s3_bucket_acl" "si" {
  count  = var.si_enabled ? 1 : 0
  bucket = aws_s3_bucket.si[count.index].id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "si" {
  count  = var.si_enabled ? 1 : 0
  bucket = aws_s3_bucket.si[count.index].id
  versioning_configuration {
    status = "Disabled"
  }
}
