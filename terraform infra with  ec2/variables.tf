








variable "vpc-name" {
 type = string
 default = "terraform vpc"
 description = "name of the vpc"
}

variable "public-subnet-name" {
 type = string
 default = "gourav-public-subnet"
 description = "name of public subnet"
}

variable "private-subnet-name" {
 type = string
 default = "gourav-private-subnet"
 description = "name of private subnet"
}

variable "IGW-name" {
 type = string
 default = "Gourav-IGW-terraform"
 description = "name of IGW"
}

variable "route_table_name" {
 type = string
 default = "public route table"
 description = "name of public table"
}

variable "route_table_name_private" {
 type = string
 default = "private route table"
 description = "name of private table"
}

variable "aws_nat_name" {
 type = string
 default = "aws-nat_gtw"
 description = "name of NAT"
}

variable "cidr" {
 type = string
 default = "10.0.0.0/16"
 description = "cidr range of vpc"
}

variable "cidr-pub-subnet" {
 type = string
 default = "10.0.1.0/24"
 description = "cidr range of public subnet"
}

variable "cidr-pvt-subnet" {
 type = string
 default = "10.0.2.0/24"
 description = "cidr range of private subnet"
}


variable "availability_zone-of-pub-subnet" {
 type = string
 default = "us-east-1a"
 description = "avaibility zone of public subnet"
}

variable "availability_zone-of-pvt-subnet" {
 type = string
 default = "us-east-1a"
 description = "avaibility zone of private subnet"
}

variable "region" {
 type = string
 default = "us-east-1"
 description = "region selection"
}

variable "security_group_name" {
 type = string
 default = "sg-terraform"
 description = "security group name"
}

variable "ec2_ami" {
  type = map

  default = {
    us-east-1 = "ami-02b972fec07f1e659"
    #us-west-1 = "ami-052dee1a5d9946f30"
    us-west-1 = "ami-020c1c4ef042c1253"
  }
}

/*variable "ami" {
 type = string
 default = "ami-01b5ec3ed8678d8b7"
 description = "ami id for ec2"
}*/


variable "instance_type" {
 type = string
 default = "ami-01b5ec3ed8678d8b7"
 description = "type for ec2"
}

variable "key_name" {
 type = string
 default = "gourav-tf-key-ec2"
 description = "name for key for ec2"
}
variable "instance_name" {
 type = string
 default = "tf-ec2"
 description = "name for ec2"
}




