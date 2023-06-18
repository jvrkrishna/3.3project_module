########### Create ec2 instance in terraform #############
resource "aws_instance" "instance" {
  ami           = data.aws_ami.ami.id
  instance_type = "t2.micro"
  tags = {
    Name = "${var.component}-${var.env}"
  }
}

############# Create vps security group in terraform ##############
resource "aws_security_group" "sg" {
  name        = "${var.component}-${var.env}"
  description = "${var.component}-${var.env}"

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.component}-${var.env}"
  }
}