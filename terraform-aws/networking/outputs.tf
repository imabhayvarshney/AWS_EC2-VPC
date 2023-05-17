# -- networking/ouputs.tf --

output "vpc_id" {
  value = aws_vpc.vpc_1.id
}

output "public_sg" {
  value = aws_security_group.sg["public"].id
}

output "public_subnets" {
  value = aws_subnet.public_subnet.*.id
}