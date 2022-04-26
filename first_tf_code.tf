
provider "aws" {
  profile = "default"
  region = "us-east-1"
  }

  resource "aws_s3_bucket" "tf_course" {
  bucket = "tf-course-20220424"
  acl    = "private"
  }

  resource "aws_s3_bucket" "tf_course1" {
  bucket = "tf-course-202204241"
  acl    = "private"
  }

resource "aws_instance" "my_ec2" {
  ami     = "ami-0f9fc25dd2506cf6d"
  instance_type = "t2.micro"
  subnet_id = "subnet-0a4a1a488ce334610"
  associate_public_ip_address = "true"
  key_name = "demo_key"
  vpc_security_group_ids = ["sg-0a345d8592fbc038b" ]
  tags = {
     Name = "genius_instance"
 }
 user_data = <<EOF
 #!/bin/bash
 yum update -y
 yum install httpd
 systemctl enable --now httpd
EOF
 
}

