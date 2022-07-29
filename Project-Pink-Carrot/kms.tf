resource "aws_kms_key" "_" {
  description         = "CMK with KMS key material origin"
  enable_key_rotation = true

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_kms_alias" "_" {
  name          = "${terraform.workspace == "default" ? var.kms_alias : format("%s-%s",var.kms_alias,terraform.workspace)}"
  target_key_id = aws_kms_key._.id
}

#######################################################################################

resource "aws_kms_key" "us_key" {
  description         = "CMK with KMS key material origin"
  provider = aws.potato
  enable_key_rotation = true

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_kms_alias" "us_key_alias" {
  name  = "${terraform.workspace == "default" ? var.kms_alias_usa : format("%s-%s",var.kms_alias_usa,terraform.workspace)}"
  provider = aws.potato
  target_key_id = aws_kms_key.us_key.id
}