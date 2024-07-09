import {
  to = aws_instance.example
  id = "i-0d93536c244103735"
}

resource "aws_instance" "example" {
  ami = "ami-06c68f701d8090592"
  instance_type = "t2.micro"
  # (resource arguments...)
}