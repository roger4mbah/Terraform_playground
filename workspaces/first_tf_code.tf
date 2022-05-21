
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
  }

resource "aws_instance" "my_ec2" {
  ami     = "ami-0f9fc25dd2506cf6d"
  instance_type = lookup(var.instance_type,terraform.workspace)
  subnet_id = "subnet-0a4a1a488ce334610"
  associate_public_ip_address = "true"
  key_name = "demo_key"
  vpc_security_group_ids = ["sg-0a345d8592fbc038b" ]
  tags = {
     Name = "genius_instance"
 }
 user_data = "${file("./script.sh")}"
 
}

resource "aws_volume_attachment" "ebs_att" {
  device_name    = "/dev/sdh"
  volume_id      = aws_ebs_volume.example.id
  instance_id    = aws_instance.my_ec2.id
}

resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-1a"
  size              = 1
}

variable "instance_type" {
	type = map

	default = {
		default = "t2.micro"
		dev	= "t2.nano"
		qa	= "t2.medium"
		prod	= "t2.small"
}

}
