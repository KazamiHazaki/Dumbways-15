provider "aws" {
    access_key = "${var.access_key}" # access key to aws
    secret_key = "${var.secret_key}"
    region = "ap-southeast-1" # singapore region
}

resource "aws_instance" "ec2_instance" {
    ami = "${var.ami_id}" # ubuntu 20.04
    instance_type = "${var.instance_type}" # t2.micro
    key_name = "${var.ami_key_pair_name}" # key ssh to login instance
    vpc_security_group_ids = [aws_security_group.allow_ssh.id] # attach ssh security group
    tags = {
      Name = "Test-EC2"
    }
    root_block_device {
      volume_size = 20
      delete_on_termination = true
    }
    user_data = file("scripts/install_docker.sh") # script installing
} 

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "SSH_connection"

  ingress {
    description      = "SSH Connection"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

   ingress {
    from_port = 443
    protocol = "tcp"
    to_port = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

   ingress {
    from_port = -1
    protocol = "icmp"
    to_port = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

output "instance_id" {
  description = "ID dari EC2 Instance"
  value = aws_instance.ec2_instance.id  
}

output "instance_public_ip" {
   description = " Public IP EC2"
   value = aws_instance.ec2_instance.public_ip
}
