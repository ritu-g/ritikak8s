provider "aws"{
    region= "us-east-1"
}

resource "aws_security_group" "my_security_1"{
    name="my_security_1"
    description="all all the network"
    vpc_id="vpc-0b8e2591768c895f9"

ingress {
    description="allow all TCP"
    from_port=22
    to_port=22
    protocol="tcp"
    cidr_blocks=["0.0.0.0/0"]
}
egress{
    from_port=0
    to_port=0
    protocol="-1"
    cidr_blocks=["0.0.0.0/0"]

}
tags={
    Name="my_security_1"
    Env="dev"
}
}

data "aws_ami" "my_ami"{
most_recent=true
owners=["ami-04b70fa74e45c3917"]
filter{
    name="name"
    values=["ubuntu-pro-server/images/hvm-ssd-gp3/ubuntu-noble-24.04-arm64-pro-server-20240423"]
}
}
resource "aws_instance" "instance1"
resource "aws_instance" "instance1" {
  ami                    = data.aws_ami.my_ami.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.my_security_1.id]
  key_name               = "tf2"

  tags = {
    Name = "allow_tls"
    Env  = "Dev"
  }
}

variable "instance_type" {
  type    = string
  default = "t4g.micro" # Changed to an arm64 compatible instance type
}

output "hellow" {
  value = "hello! this is your first teraform file" # Correct spelling
}

output "public_ip" {
  value = aws_instance.instance1.public_ip
}