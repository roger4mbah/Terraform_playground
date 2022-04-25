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
}

