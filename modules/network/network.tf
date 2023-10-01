resource "aws_vpc" "cathyvpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "vpc - ${var.name}"
  }
}
resource "aws_subnet" "cathy-sbn" {
  vpc_id            = aws_vpc.cathyvpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = var.avZone
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.name}-sbn"
  }
}


 
resource "aws_internet_gateway" "cathy-gw" {
  vpc_id = aws_vpc.cathyvpc.id

  tags = {
    Name = "cathy-igw"
  }
}

resource "aws_route_table" "cathy_public_rt" {
    vpc_id = aws_vpc.cathyvpc.id
    

    tags = {
        Name = "cathy_public_rt"
    }
}

 resource "aws_route_table_association" "cathy_association" {
  subnet_id      = aws_subnet.cathy-sbn.id
  route_table_id = aws_route_table.cathy_public_rt.id
}

