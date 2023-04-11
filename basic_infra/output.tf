

output "vpc_id" {
  value = aws_vpc.gourav-vpc.id
}

output "public_subnet_id1A" {
  value =  aws_subnet.gourav-public-subnet1A.id
}

output "public_subnet_id1B" {
  value =  aws_subnet.gourav-public-subnet1B.id
}
output "private_subnet_id1A" {
  value =  aws_subnet.gourav-private-subnet1A.id
}


output "private_subnet_id1B" {
  value =  aws_subnet.gourav-private-subnet1B.id
}

output "elastic_ip_id" {
  value =  aws_eip.nat_gateway-eip.id
}

output "security_group_name" {
  value =  aws_security_group.gourav-terraform-security-group.name
}

output "security_group_name_FOR_LB" {
  value =  aws_security_group.gourav-terraform-security-group_for_LB.name
}