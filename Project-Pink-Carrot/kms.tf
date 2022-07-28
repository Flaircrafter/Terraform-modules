resource "aws_kms_key" "_" {
  description         = "CMK with KMS key material origin"
  enable_key_rotation = true

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_kms_alias" "_" {
  name          = var.kms_alias
  target_key_id = aws_kms_key._.id
}