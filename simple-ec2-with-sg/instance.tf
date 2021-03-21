resource "aws_instance" "papaya" {
	ami = "ami-0b84c6433cdbe5c3e"
	instance_type = var.instatype
	key_name = "terraform-key"
	vpc_security_group_ids = [aws_security_group.black-salt.id]
	tags = {
		Name = "${var.environ}-papaya"
	}
	user_data = data.template_file.ds-user-data.rendered
}
