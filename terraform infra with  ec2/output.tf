

output "vpc_id" {
  value = aws_vpc.gourav-vpc.id
}

output "public_subnet_id" {
  value =  aws_subnet.gourav-public-subnet.id
}

output "private_subnet_id" {
  value =  aws_subnet.gourav-private-subnet.id
}

output "elastic_ip_id" {
  value =  aws_eip.nat_gateway-eip.id
}

output "security_group_name" {
  value =  aws_security_group.gourav-terraform-security-group.name
}

output "key_name" {
  value =  aws_key_pair.gourav_terrafoerm_key.key_name
}



output "public_ip" {
  value = aws_instance.gourav-ec2-terraform.*.public_ip
  
}

output "private_ip" {
  value = aws_instance.gourav-ec2-terraform.*.private_ip
}