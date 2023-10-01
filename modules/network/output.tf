output "vpc_id" {
  value = aws_vpc.cathyvpc.id
}

output "subnetId" {
    value = aws_subnet.cathy-sbn.id
  
}