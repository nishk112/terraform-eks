resource "aws_internet_gateway" "this" {
  vpc_id = var.vpc_id

  tags = {
    Name = "eks-igw"
  }
}
resource "aws_route_table" "public" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name = "public-rt"
  }
}
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = var.public_subnet_id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table" "private" {
  vpc_id = var.vpc_id

  tags = {
    Name = "private-rt"
  }
}
resource "aws_route_table_association" "private_assoc" {
  subnet_id      = var.private_subnet_id
  route_table_id = aws_route_table.private.id
}
resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name = "nat-eip"
  }
}
resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.nat.id
  subnet_id     = var.public_subnet_id

  tags = {
    Name = "eks-nat"
  }

  depends_on = [aws_internet_gateway.this]
}
resource "aws_route" "private_nat_route" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.this.id
}
