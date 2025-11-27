resource "aws_instance" "roboshop" {
    ami           = "ami-09c813fb71547fc4f" # Replace with a valid AMI ID for your region
    instance_type = "t3.micro"
    vpc_security_group_ids = [ aws_security_group.allow_all.id ]

    tags = {
        Name = "roboshop"
    }
  }

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all traffic"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # All protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # All protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_all_traffic"
  }
}