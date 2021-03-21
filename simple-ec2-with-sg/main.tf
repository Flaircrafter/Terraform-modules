#provider "aws" {
#	region = "ap-south-1"
#}
terraform {
        backend "s3" {
                bucket = "meraform-state"
                key = "testing/terraform.tfstate"
                region = "ap-south-1"
                dynamodb_table = "tf-lock"
                encrypt = true
        }
}
