output "ip" {
	value = aws_instance.papaya.public_ip
	description = "Public IP address"
}
#output "IAMuserSpecification" {
#	value = data.aws_iam_user.custom-name.arn
#	description = "Path of the IAM user"
#}
