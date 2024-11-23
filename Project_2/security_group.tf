resource "aws_security_group" "sg_virginia" {
    provider = aws.virginia_region
    name = "sg_virginia"
    vpc_id = aws_vpc.home-lab-vpc-virginia.id
    ingress {
        description = "SSH access"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["91.223.60.214/32"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "sg_virginia"
    }
}