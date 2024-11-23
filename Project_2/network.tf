resource "aws_vpc" "home-lab-vpc-virginia" {
    provider = aws.virginia_region
    cidr_block = "172.16.0.0/16"
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = {
        Name = "home-lab-vpc-virginia"
    }
}

resource "aws_subnet" "subnet-1" {
    provider = aws.virginia_region
    vpc_id = aws_vpc.home-lab-vpc-virginia.id
    cidr_block = "172.16.1.0/24"
    tags = {
        Name = "subnet-1"
    }
}

resource "aws_internet_gateway" "igw" {
    provider = aws.virginia_region
    vpc_id = aws_vpc.home-lab-vpc-virginia.id
    tags = {
        Name = "igw"
    }
}

resource "aws_route_table" "rtb" {
    provider = aws.virginia_region
    vpc_id = aws_vpc.home-lab-vpc-virginia.id
# name of the resource
    tags = {
        Name = "rtb"
    }
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

}

resource "aws_route_table_association" "rta" {
    provider = aws.virginia_region
    subnet_id = aws_subnet.subnet-1.id
    route_table_id = aws_route_table.rtb.id
}