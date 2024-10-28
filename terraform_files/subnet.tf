resource "aws_subnet" "subnet1" {
  vpc_id                  = aws_vpc.vpc1.id
  cidr_block              = var.subnet1_cidr
  availability_zone       = var.subnet_az1
  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet2" {
  vpc_id                  = aws_vpc.vpc1.id
  cidr_block              = var.subnet2_cidr
  availability_zone       = var.subnet_az2
  map_public_ip_on_launch = true
}