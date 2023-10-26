resource "aws_vpc" "vpc" {
  tags = {
    Name = var.vpc_name
  }

  cidr_block = var.vpc_cidr_block
  enable_dns_hostnames = true
}

# Public subnets

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_subnet" "public_subnets" {
  count = length(var.availability_zones)

  vpc_id = aws_vpc.vpc.id
  availability_zone = var.availability_zones[count.index]
  cidr_block = var.public_subnet_cidr_blocks[count.index]

  tags = {
    Name = "${var.vpc_name} public subnet ${var.availability_zones[count.index]}"
    public = true
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.vpc_name} public route table"
    public = true
  }
}

resource "aws_route" "internet_gateway_route" {
  route_table_id = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.internet_gateway.id
}

resource "aws_route_table_association" "public_subnets_route_association" {
  count = length(aws_subnet.public_subnets)
  route_table_id = aws_route_table.public_route_table.id
  subnet_id = aws_subnet.public_subnets[count.index].id
}

# Private subnets

resource "aws_subnet" "private_subnets" {
  count = length(var.availability_zones)

  vpc_id = aws_vpc.vpc.id
  availability_zone = var.availability_zones[count.index]
  cidr_block = var.private_subnet_cidr_blocks[count.index]

  tags = {
    Name = "${var.vpc_name} private subnet ${var.availability_zones[count.index]}"
    public = false
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.vpc_name} private route table"
    public = false
  }
}

resource "aws_route_table_association" "private_route_table_association" {
  count = length(aws_subnet.private_subnets)
  route_table_id = aws_route_table.private_route_table.id
  subnet_id = aws_subnet.private_subnets[count.index].id
}