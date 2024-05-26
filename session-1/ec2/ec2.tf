resource "aws_instance" "web" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t3.micro"
  vpc_security_group_ids=[aws_security_group.roboshop-all.id]  # list

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_security_group" "roboshop-all" {   #this  is terraform name, for terraform reference only
  name        = "roboshop-all-aws"   # this is for aws
  description = "Allow TLS inbound traffic"
  #vpc_id      = aws_vpc.main.id
  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]  #internet reference
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name = "roboshop-all-aws"
  }
}
