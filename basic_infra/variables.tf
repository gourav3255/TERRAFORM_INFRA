variable "vpc-name" {
 type = string
 default = "terraform vpc"
 description = "name of the vpc"
}

variable "public-subnet-name1A" {
 type = string
 default = "gourav-public-subnet"
 description = "name of public subnet"
}

variable "public-subnet-name1B" {
 type = string
 default = "gourav-public-subnet"
 description = "name of public subnet"
}

variable "private-subnet-name1A" {
 type = string
 default = "gourav-private-subnet"
 description = "name of private subnet"
}
variable "private-subnet-name1B" {
 type = string
 default = "gourav-private-subnet"
 description = "name of private subnet"
}

variable "IGW-name" {
 type = string
 default = "gourav-IGW-terraform"
 description = "name of IGW"
}

variable "route_table_name_public" {
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

variable "cidr-pub-subnet1A" {
 type = string
 default = "10.0.1.0/24"
 description = "cidr range of public subnet"
}
variable "cidr-pub-subnet1B" {
 type = string
 default = "10.0.1.0/24"
 description = "cidr range of public subnet"
}

variable "cidr-pvt-subnet1A" {
 type = string
 default = "10.0.2.0/24"
 description = "cidr range of private subnet"
}

variable "cidr-pvt-subnet1B" {
 type = string
 default = "10.0.2.0/24"
 description = "cidr range of private subnet"
}

variable "availability_zone-of-pub-subnet1A" {
 type = string
 default = "us-east-1a"
 description = "avaibility zone of public subnet"
}

variable "availability_zone-of-pub-subnet1B" {
 type = string
 default = "us-east-1b"
 description = "avaibility zone of public subnet"
}

variable "availability_zone-of-pvt-subnet1A" {
 type = string
 default = "us-east-1a"
 description = "avaibility zone of private subnet"
}


variable "availability_zone-of-pvt-subnet1B" {
 type = string
 default = "us-east-1b"
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

variable "security_group_name_for_LB" {
 type = string
 default = "LB-sg-terraform"
 description = "security group name FOR LB"
}