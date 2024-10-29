# Public subnets associated with the public route table
resource "aws_route_table_association" "public_subnet_1_association" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.rt1.id
}

resource "aws_route_table_association" "public_subnet_2_association" {
  subnet_id      = aws_subnet.public-subnet-2.id
  route_table_id = aws_route_table.rt1.id
}

# Private subnets associated with the private route table
resource "aws_route_table_association" "private_subnet_1_association" {
  subnet_id      = aws_subnet.private-subnet-1.id
  route_table_id = aws_route_table.rt2.id
}

resource "aws_route_table_association" "private_subnet_2_association" {
  subnet_id      = aws_subnet.private-subnet-2.id
  route_table_id = aws_route_table.rt2.id
}
