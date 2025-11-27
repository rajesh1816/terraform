variable "ami_id" {
    type = string
    default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "ec2_tags" {
    default = {
        Name = "roboshop"
    }
}

variable "sg_name" {
    default = "allow_all"
}

variable "sg_desc" {
    default = "Allow all traffic"
}

variable "from_port" {
    type = number
    default = 0 
}

variable "to_port" {
    type = number
    default = 0
}

variable "cidr_block" {
    type = list(string)
    default = [ "0.0.0.0/0" ]
}

variable "protocol" {
    type = number
    default = -1
}


variable "sg_tags" {
    default = {
        Name = "allow_all_traffic"
    }
  
}

variable "environment" {
    #default = "prod"
    default = "dev"
}

/* variable "instances" {  
    type = map(string)
    default = {
        mongodb = "t2.micro"
        mysql = "t2.micro"
        frontend = "t2.small" #each keyword is assigned for every iteration you will get each.key and each.value
    }
}
 */


 variable "instances" {
    type = set(string)
    default = ["mongodb", "mysql", "frontend"]
   
 }
variable "zone_id" {
    default = "Z00035852NN6D25PW7BUM"
}

variable "domain_name" {
    default = "rajeshit.space"
}



