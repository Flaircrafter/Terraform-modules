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

#######################################################################################

resource "aws_kms_key" "us_key" {
  description         = "CMK with KMS key material origin"
  provider = aws.amerikha
  enable_key_rotation = true

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_kms_alias" "us_key_alias" {
  name          = var.kms_alias_usa
  provider = aws.amerikha
  target_key_id = aws_kms_key.us_key.id
}