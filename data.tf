data "aws_ami" "fedora" {
  most_recent = true

  filter {
    name   = "name"
    values = ["Fedora-Cloud-Base-39-*"] # Updated to Fedora 39
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  owners = ["125523088429"] # Official Fedora Project
}