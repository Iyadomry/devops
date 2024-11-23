resource "aws_instance" "ubuntu_vm_virginia" {
  provider               = aws.virginia_region
  ami                    = "ami-0fc5d935ebf8bc3bc" 
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.subnet-1.id
  key_name               = "home-lab"                       
  vpc_security_group_ids = [aws_security_group.sg_virginia.id]
  user_data = <<-EOF
              #!/bin/bash

              sudo apt update -y
              sudo apt install apache2 -y
              sudo systemctl start apache2
              sudo systemctl enable apache2
              
              EOF
  ## elatic ip 
  associate_public_ip_address = true
    tags = {
        Name = "UbuntuVM1"
    }
}

output "public_ip" {
  value = aws_instance.ubuntu_vm_virginia.public_ip
}
