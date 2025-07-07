output "vpc_id" {
  value = aws_vpc.this.id
}

output "internet_gateway" {
  value = aws_internet_gateway.this.id
}

output "nat_gateway_id" {
  value = aws_internet_gateway.this[*].id
}

output "public_subnets_id" {
  value = aws_subnet.public[*].id
}

output "private_subnets_id" {
  value = aws_subnet.private[*].id
}