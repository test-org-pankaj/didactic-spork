resource "aws_cloudwatch_log_group" "km_log_group_test" {
  name              = "km_log_group_${var.environment}"
  retention_in_days = 1

  tags = merge(var.default_tags, {
    Name = "km_log_group_${var.environment}"
  })
}

resource "aws_instance" "km_vm_test"{
  ami = data.aws_ami.ubuntu_ami.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [ var.elb_sg ]
  subnet_id = var.public_subnet[0]
  tags = merge(var.default_tags, {
    Name = "km_vm_${var.environment}"
  })
}
