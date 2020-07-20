# Creating Public Facing Internet Gateway
resource "aws_internet_gateway" "public_internet_gw" {
  vpc_id =  aws_vpc.my_vpc.id

  tags = {
    Name = "public_facing_internet_gateway"
  }
}

# Allowing default route table to go to Internet Gateway 
resource "aws_default_route_table" "gw_router" {
  default_route_table_id = aws_vpc.my_vpc.default_route_table_id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.public_internet_gw.id
    }

  tags = {
    Name = "default table"
  }
}

# Associating Public Subnet 
resource "aws_route_table_association" "associate_subnet" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_default_route_table.gw_router.id
}
