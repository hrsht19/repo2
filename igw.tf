# to provide access to the services we need to have internet gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id       #required

  tags = {
    Name = "igw"
  }
}
