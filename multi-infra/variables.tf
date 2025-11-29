variable "ami_id" {
  default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ec2_tags" {
  default = {
    Name = "mongodb"
  }
}

variable "sg_name" {
  default = "allow_all"
}

variable "sg_description" {
  default = "allow_all_traffic"
}


variable "from_port" {
  default = 0
}

variable "to_port" {
  default = 0
}

variable "cidr_blocks" {
  default = ["0.0.0.0/0"]
}

variable "sg_tags" {
  default = {
    Name = "allow_all_trffic"
  }
}

