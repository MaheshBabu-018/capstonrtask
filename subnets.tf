resource "aws_subnet" "frontend_public_1" {
  vpc_id                  = aws_vpc.frontend_vpc.id
  cidr_block              = "192.168.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "frontend_public_2" {
  vpc_id                  = aws_vpc.frontend_vpc.id
  cidr_block              = "192.168.2.0/24"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "backend_private_1" {
  vpc_id            = aws_vpc.backend_vpc.id
  cidr_block        = "172.32.1.0/24"
  availability_zone = "ap-south-1a"
}

resource "aws_subnet" "backend_private_2" {
  vpc_id            = aws_vpc.backend_vpc.id
  cidr_block        = "172.32.2.0/24"
  availability_zone = "ap-south-1b"
}
