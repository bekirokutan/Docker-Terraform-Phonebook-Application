data "aws_vpc" "selected" {
  default = true
}

data "aws_subnets" "pb-subnets" {
  filter {
    name   = "default-for-az"
    values = ["true"]
  }
}

data "aws_acm_certificate" "cert" {
  domain   = var.hosted-zone
  statuses = ["ISSUED"]
}
  


data "aws_ami" "amazon-linux-2" {
  owners = ["amazon"]
  most_recent = true
  filter {
    name = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

data "template_file" "phonebook" {
  template = "${file("${path.module}/user-data.sh")}"
  vars = {
    user-data-git-token = var.git-token
    user-data-git-name = var.git-name
  }
}

data "aws_route53_zone" "selected" {
  name         = var.hosted-zone
}