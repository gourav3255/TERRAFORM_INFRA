vpc-name="gourav-vpc"
public-subnet-name1A="gourav-public-subnet1A"
public-subnet-name1B="gourav-public-subnet1B"
private-subnet-name1A="gourav-private-subnet1A"
private-subnet-name1B="gourav-private-subnet1B"
IGW-name="gourav-IGW-terraform"
route_table_name_public="gourav-public-route-table"
route_table_name_private="gourav-private-route-table"
aws_nat_name="aws-my-terraform-nat"


cidr="10.0.0.0/16"
cidr-pub-subnet1A="10.0.1.0/24"
cidr-pub-subnet1B="10.0.1.0/24"
cidr-pvt-subnet1A="10.0.2.0/24"
cidr-pvt-subnet1B="10.0.2.0/24"
availability_zone-of-pub-subnet1A= "us-east-1a"

availability_zone-of-pub-subnet1B= "us-east-1b"
availability_zone-of-pvt-subnet1A= "us-east-1a"
availability_zone-of-pvt-subnet1B= "us-east-1b"
region= "us-east-1"

security_group_name="gourav-sg-using-terraform"

security_group_name_for_LB="gourav-sg-using-terraform_LB"