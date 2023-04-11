vpc-name="gourav-vpc"
public-subnet-name="gourav-public-subnet"
private-subnet-name="gourav-private-subnet"
IGW-name="gourav-IGW-terraform"
route_table_name="gourav-public-route-table"
route_table_name_private="gourav-private-route-table"
aws_nat_name="aws-my-terraform-nat"
security_group_name="gourav-sg-using-terraform"
#ami="ami-02b972fec07f1e659"

instance_type="t2.micro"
instance_name="gourav_tf_ec2"
key_name = "gourav-tf-key-ec2"
cidr="10.0.0.0/16"
cidr-pub-subnet="10.0.1.0/24"
cidr-pvt-subnet="10.0.2.0/24"
availability_zone-of-pub-subnet= "us-west-1a"
availability_zone-of-pvt-subnet= "us-west-1a"
region= "us-west-1"

