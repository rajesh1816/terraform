resource "aws_instance" "roboshop" {
    ami           = var.ami_id # Replace with a valid AMI ID for your region
    instance_type = var.instance_type
    vpc_security_group_ids = [ aws_security_group.allow_all.id ]

    tags =  var.ec2_tags
  }

resource "aws_security_group" "allow_all" {
  name        = var.sg_name
  description = var.sg_desc

  ingress {
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = var.protocol # All protocols
    cidr_blocks = var.cidr_block
  }

  egress {
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = var.protocol # All protocols
    cidr_blocks = var.cidr_block
  }

  tags = var.sg_tags
}