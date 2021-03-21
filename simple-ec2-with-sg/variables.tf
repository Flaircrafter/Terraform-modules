variable "server_port" {
	description = "web service available at port number"
	type = number
	default = 8080
}

data "terraform_remote_state" "remote-s3" {
        backend = "s3"

        config = {
                bucket = "meraform-state"
                key = "global/s3/terraform.tfstate"
                region = "ap-south-1"
        }
}

data "template_file" "ds-user-data" {
        template = file("${path.module}/script.sh")
        vars = {
                bucket-type = data.terraform_remote_state.remote-s3.outputs.flower
                serveport = 8080
        }
}

variable "instatype" {
	description = "Type of instance"
	type = string
}

variable "environ" {
	description = "Type of environment"
	type = string
}

locals {
  fromport = 8080
  toport = 8080
  cidr = ["182.69.74.70/32"]
  proto = "tcp"
}
