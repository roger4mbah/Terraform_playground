provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_s3_bucket" "prod_tf_course" {
  bucket = "prodtfcourse20222904"
  acl    = "private"
}

resource "aws_instance" "mywebinstance" {
  ami = "ami-065fb54436c0e2d57"
  instance_type = "t2.nano"
  subnet_id = "subnet-0a4a1a488ce334610"
  associate_public_ip_address = "true"
  vpc_security_group_ids = [
   aws_security_group.prod_web.id
 ]
 
 tags = {
  "Terraform" : "true"
 }

}

resource "aws_security_group" "prod_web" {
  name = "prod_web"
  description = "Allow std http and https ports inbound and everything outbound"
  vpc_id = "vpc-0a7829dfe64215b65"  
  ingress {
     from_port   = 80
     to_port     = 80
     protocol    = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
   
}
  ingress {
     from_port   = 443
     to_port     = 443
     protocol    = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
}
  egress {
     from_port   = 0
     to_port     = 0
     protocol    = "-1"
     cidr_blocks = ["0.0.0.0/0"]
 }
 
 tags = {
   "Terraform" : "true"
  }
}
resource "aws_eip" "prod_web" {
  instance = aws_instance.mywebinstance.id
}
