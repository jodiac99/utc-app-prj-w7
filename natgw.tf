# Nat Gateway

resource "aws_eip" "el1" {

}

resource "aws_nat_gateway" "nat1" {
  allocation_id = aws_eip.el1.id
  subnet_id     = aws_subnet.public1.id

}

# Public route table
resource "aws_route_table" "rtpu" {
  vpc_id = aws_vpc.vp1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gtw1.id
  }
}
# private route table
resource "aws_route_table" "rtpri" {
  vpc_id = aws_vpc.vp1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat1.id
  }
}