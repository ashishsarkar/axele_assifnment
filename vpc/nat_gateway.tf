# resource "aws_subnet" "nat_gateway" {
#   availability_zone = data.aws_availability_zones.available.names[0]
#   cidr_block = "10.0.2.0/24"
#   vpc_id = aws_vpc.vpc.id
#   tags = {
#     "Name" = "DummySubnetNAT"
#   }
# }

# resource "aws_internet_gateway" "nat_gateway" {
#   vpc_id = aws_vpc.vpc.id
#   tags = {
#     "Name" = "DummyGateway"
#   }
# }

# resource "aws_route_table" "nat_gateway" {
#   vpc_id = aws_vpc.vpc.id
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.nat_gateway.id
#   }
# }

# resource "aws_route_table_association" "nat_gateway" {
#   subnet_id = aws_subnet.nat_gateway.id
#   route_table_id = aws_route_table.nat_gateway.id
# }

resource "aws_eip" "nat_gateway" {
  vpc = true
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id = aws_subnet.public.id
  tags = {
    "Name" = "Nat Gateway"
  }
}


resource "aws_route_table" "nat_instance" {
  vpc_id = "${aws_vpc.primary_vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }
}

resource "aws_route_table_association" "instance" {
  subnet_id = aws_subnet.instance.id
  route_table_id = aws_route_table.nat_instance.id
}