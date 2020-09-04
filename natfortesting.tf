# for testing bootstrap created NAT, IGW, EIP, Rout table, route, route association

resource "aws_nat_gateway" "nat" {
    allocation_id = aws_eip.nat_ip.id
    subnet_id = "subnet-02246346e41f26b7b"
    depends_on = [aws_internet_gateway.gw]
}

resource "aws_eip" "nat_ip" {
  vpc      = true
  #depends_on = [aws_internet_gateway.gw]
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "vpc-0597074cbd4d61848"
}

resource "aws_route_table" "route-table" {
  vpc_id = "vpc-0597074cbd4d61848"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

}
#resource "aws_route" "route" {
#  route_table_id            = "aws_route_table.route-table.id"
#  destination_cidr_block    = "10.0.0.0/16"
#}

resource "aws_route_table_association" "app-tier-associaton1" {
  subnet_id      = "subnet-02eb98a6c98657948"
  route_table_id = aws_route_table.route-table.id
}

resource "aws_route_table_association" "app-tier-associaton2" {
  subnet_id      = "subnet-0f07916fc5091eb99"
  route_table_id = "${aws_route_table.route-table.id}"
}