########### Create ec2 instance in terraform #############
resource "aws_instance" "instance" {
  ami           = data.aws_ami.ami.id
  instance_type = "t2.micro"

  tags = {
    Name = "${var.component}-${var.env}"
  }
}

