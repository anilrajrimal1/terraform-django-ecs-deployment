resource "aws_eip" "eip_natgateway" {
  depends_on = [aws_internet_gateway.igw1]
  tags = {
    Name = "nat-eip"
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.eip_natgateway.id
  subnet_id     = aws_subnet.public-subnet-1.id
  tags = {
    Name = "nat-gateway"
  }
}