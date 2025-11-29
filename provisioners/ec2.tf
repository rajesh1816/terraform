resource "aws_instance" "roboshop" {
  count                  = length(var.instances)
  ami                    = var.ami_id # Replace with a valid AMI ID for your region
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_all.id]

  tags = merge(
    var.common-tags,
    {
      Name      = var.instances[count.index]
      component = var.instances[count.index]
    }
  )

  provisioner "local-exec" {
    command    = "echo ${self.private_ip} > localip"
    on_failure = continue
  }


  provisioner "local-exec" {
    command = "echo 'resource is detroyed'"
    when    = destroy
  }

  connection {
    type        = "ssh"
    user        = "ec2-user" # Or appropriate user for your AMI
    password    = "DevOps321" # Path to your private key
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]
  }

  provisioner "remote-exec" {
    when = destroy
    inline = [
      "sudo systemctl stop nginx"
    ]
  }

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

  tags = merge(
    var.common-tags,
    {
      Name = "allow-all"
    }
  )

}