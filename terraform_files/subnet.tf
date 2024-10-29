resource "aws_subnet" "public-subnet-1" {
  vpc_id                  = aws_vpc.vpc1.id
  cidr_block              = var.public-subnet-1
  availability_zone       = var.subnet_az1
  map_public_ip_on_launch = true
}

resource "aws_subnet" "public-subnet-2" {
  vpc_id                  = aws_vpc.vpc1.id
  cidr_block              = var.public-subnet-2
  availability_zone       = var.subnet_az2
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private-subnet-1" {
  vpc_id                  = aws_vpc.vpc1.id
  cidr_block              = var.private-subnet-1
  availability_zone       = var.subnet_az1
  map_public_ip_on_launch = false
}

resource "aws_subnet" "private-subnet-2" {
  vpc_id                  = aws_vpc.vpc1.id
  cidr_block              = var.private-subnet-2
  availability_zone       = var.subnet_az2
  map_public_ip_on_launch = false
}
