resource "aws_instance" "instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = var.security_groups

  tags = {
    Name = "${var.environment}-ec2-instance"
  }
}
