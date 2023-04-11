
//creating VPC

resource "aws_vpc" "gourav-vpc" {
  cidr_block = var.cidr
  tags = {
    "Name" = var.vpc-name #to use the value and else ("Name" = "value")
  }
}

//public subnet

resource "aws_subnet" "gourav-public-subnet" {
    vpc_id = aws_vpc.gourav-vpc.id
    cidr_block = var.cidr-pub-subnet
    availability_zone = var.availability_zone-of-pub-subnet
    map_public_ip_on_launch = true
    tags = {
    "Name" = var.public-subnet-name
  }
  
}
//private subnet

resource "aws_subnet" "gourav-private-subnet" {
    vpc_id = aws_vpc.gourav-vpc.id
    cidr_block = var.cidr-pvt-subnet
    availability_zone = var.availability_zone-of-pvt-subnet
    map_public_ip_on_launch = true
    tags = {
    "Name" = var.private-subnet-name
  }
}


//internet gateway

resource "aws_internet_gateway" "gourav-vpc-igw" {
    vpc_id = aws_vpc.gourav-vpc.id
    tags = {
    "Name" = var.IGW-name
  }
}

//public route table

resource "aws_route_table" "gourav-vpc-public-route-table" {
    vpc_id = aws_vpc.gourav-vpc.id
    tags = {
    "Name" = var.route_table_name
  }
}
//route of public route table

resource "aws_route" "gourav-vpc-public-route" {
  route_table_id         = aws_route_table.gourav-vpc-public-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gourav-vpc-igw.id
}

//association of public route table

resource "aws_route_table_association" "gourav-vpc-public-route-table-associate" {
  route_table_id = aws_route_table.gourav-vpc-public-route-table.id
  subnet_id      = aws_subnet.gourav-public-subnet.id
}

//aws private route and its table

resource "aws_route_table" "gourav-vpc-private-route-table" {
    vpc_id = aws_vpc.gourav-vpc.id
    tags = {
    "Name" = var.route_table_name_private
  }
  
}

//nat and eip for private

resource "aws_eip" "nat_gateway-eip" {
  vpc = true
}

resource "aws_nat_gateway" "nat_gateway-eip" {
  allocation_id = aws_eip.nat_gateway-eip.id      #NAT gtway is put in public subnet 
  subnet_id     = aws_subnet.gourav-public-subnet.id
  tags = {
    "Name" = var.aws_nat_name
  }
  
}
//private route 

resource "aws_route" "gourav-vpc-private-route" {
  route_table_id         = aws_route_table.gourav-vpc-private-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.nat_gateway-eip.id
}
//private table ssociation

resource "aws_route_table_association" "gourav-vpc-private-route-table-associate" {
  route_table_id = aws_route_table.gourav-vpc-private-route-table.id
  subnet_id      = aws_subnet.gourav-private-subnet.id
}
//security group and its traffic
resource "aws_security_group" "gourav-terraform-security-group" {
  name = var.security_group_name


  #Incoming traffic
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #replace it with your ip address
  }

  #Outgoing traffic
  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "gourav_terrafoerm_key" {
  key_name = var.key_name
  public_key = file("/home/gourav/teraform_test/terraform infra with  ec2/gourav_terrafoerm_key.pub")
}
//ec2 instence

resource "aws_instance" "gourav-ec2-terraform" {

  count = 4
  ami = lookup(var.ec2_ami,var.region)
  instance_type = var.instance_type
  key_name = aws_key_pair.gourav_terrafoerm_key.key_name
  security_groups = [aws_security_group.gourav-terraform-security-group.name]
   tags = {
    # The count.index allows you to launch a resource 
    # starting with the distinct index number 0 and corresponding to this instance.
    Name = "my-machine-${count.index}"
  }
}