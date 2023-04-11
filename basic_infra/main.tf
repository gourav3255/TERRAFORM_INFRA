
//creating VPC

resource "aws_vpc" "gourav-vpc" {
  cidr_block = var.cidr
  tags = {
    "Name" = var.vpc-name     #to use the value and else ("Name" = "value")
  }
}

//public subnet1

resource "aws_subnet" "gourav-public-subnet1A" {
    vpc_id = aws_vpc.gourav-vpc.id
    cidr_block = var.cidr-pub-subnet1A
    availability_zone = var.availability_zone-of-pub-subnet1A
    map_public_ip_on_launch = true
    tags = {                               //insert query on history table is generated multiple times with different
    "Name" = var.public-subnet-name1A
  }

}
//publicsubnet2
resource "aws_subnet" "gourav-public-subnet1B" {
    vpc_id = aws_vpc.gourav-vpc.id
    cidr_block = var.cidr-pub-subnet1B
    availability_zone = var.availability_zone-of-pub-subnet1B
    map_public_ip_on_launch = true
    tags = {                               //insert query on history table is generated multiple times with different
    "Name" = var.public-subnet-name1B
  }
  
}
//private subnet1

resource "aws_subnet" "gourav-private-subnet1A" {
    vpc_id = aws_vpc.gourav-vpc.id
    cidr_block = var.cidr-pvt-subnet1A
    availability_zone = var.availability_zone-of-pvt-subnet1A
    map_public_ip_on_launch = true
    tags = {
    "Name" = var.private-subnet-name1A
  }
}

//private subnet2
resource "aws_subnet" "gourav-private-subnet1B" {
    vpc_id = aws_vpc.gourav-vpc.id
    cidr_block = var.cidr-pvt-subnet1B
    availability_zone = var.availability_zone-of-pvt-subnet1B
    map_public_ip_on_launch = true
    tags = {
    "Name" = var.private-subnet-name1B
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

resource "aws_route_table" "gourav-vpc-public-RT" {
    vpc_id = aws_vpc.gourav-vpc.id
    tags = {
    "Name" = var.route_table_name_public
  }
}
//route of public route table

resource "aws_route" "gourav-vpc-public-RT" {
  route_table_id         = aws_route_table.gourav-vpc-public-RT.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gourav-vpc-igw.id
}

//association of public route table

resource "aws_route_table_association" "gourav-vpc-public-route-table-associate-1A" {
  route_table_id = aws_route_table.gourav-vpc-public-RT.id
  subnet_id      = aws_subnet.gourav-public-subnet1A.id
}

resource "aws_route_table_association" "gourav-vpc-public-route-table-associate-1B" {
  route_table_id = aws_route_table.gourav-vpc-public-RT.id
  subnet_id      = aws_subnet.gourav-public-subnet1B.id
}

//aws private route and its table

resource "aws_route_table" "gourav-vpc-private-RT" {
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
  subnet_id     = aws_subnet.gourav-public-subnet1A.id
  tags = {
    "Name" = var.aws_nat_name
  }
  
}
//private route 

resource "aws_route" "gourav-vpc-private-route" {
  route_table_id         = aws_route_table.gourav-vpc-private-RT.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.nat_gateway-eip.id
}
//private table ssociation

resource "aws_route_table_association" "gourav-vpc-private-route-table-associate-1A" {
  route_table_id = aws_route_table.gourav-vpc-private-RT.id
  subnet_id      = aws_subnet.gourav-private-subnet1A.id
    
  
}
resource "aws_route_table_association" "gourav-vpc-private-route-table-associate-1B" {
  route_table_id = aws_route_table.gourav-vpc-private-RT.id
  subnet_id      = aws_subnet.gourav-private-subnet1B.id
    
  
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


resource "aws_security_group" "gourav-terraform-security-group_for_LB" {
  name = var.security_group_name


  #Incoming traffic
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #replace it with your ip address
  }
   
  #Incoming traffic
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #replace it with your ip address
  }
 
}
