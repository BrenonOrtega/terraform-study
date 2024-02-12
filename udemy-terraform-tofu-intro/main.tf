resource "aws_vpc" "DEV_vpc" {
  cidr_block           = "10.152.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "dev-vpc"
  }
}

resource "aws_subnet" "DEV_public_subnet" {
  vpc_id                  = aws_vpc.DEV_vpc.id
  cidr_block              = "10.152.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    "Name" = "dev-public-subnet"
  }
}

resource "aws_internet_gateway" "DEV_internet_gateway" {
  vpc_id = aws_vpc.DEV_vpc.id

  tags = {
    Name = "dev-internet-gateway"
  }
}