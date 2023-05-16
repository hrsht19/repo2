# here we will have 2 public and 2 pvt subnets in different AZs for the purpose of EKS.

resource "aws_subnet" "private-ap-southeast-2a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.0/19"
  availability_zone = ""

  tags = {
    "Name"                            = "private-ap-southeast-2a"
    "kubernetes.io/role/internal-elb" = "1"  #required bcoz it allows k8s to discover our subnets where pvt loadblancers will be created
    "kubernetes.io/cluster/demo"      = "owned"  #required here demo is the name of our EKS cluster
  }
}

resource "aws_subnet" "private-ap-southeast-2b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.32.0/19"
  availability_zone = "ap-southeast-2b"

  tags = {
    "Name"                            = "private-ap-southeast-2b"
    "kubernetes.io/role/internal-elb" = "1"  #required bcoz it allows k8s to discover our subnets where pvt loadblancers will be created
    "kubernetes.io/cluster/demo"      = "owned"
  }
}

resource "aws_subnet" "public-ap-southeast-2a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.64.0/19"
  availability_zone       = "ap-southeast-2a"
  map_public_ip_on_launch = true

  tags = {
    "Name"                       = "public-ap-southeast-2a"
    "kubernetes.io/role/elb"     = "1"  #This instructs k8s to create public LB in this subnet
    "kubernetes.io/cluster/demo" = "owned"
  }
}

resource "aws_subnet" "public-ap-southeast-2b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.96.0/19"
  availability_zone       = "ap-southeast-2b"
  map_public_ip_on_launch = true

  tags = {
    "Name"                       = "public-ap-southeast-2b"
    "kubernetes.io/role/elb"     = "1"  #This instructs k8s to create public LB in this subnet
    "kubernetes.io/cluster/demo" = "owned"
  }
}
