packer {
  required_plugins {
    amazon = {
      version = ">= 1.1.4"
      source = "github.com/hashicorp/amazon"
    }
  }
}
 source "amazon-ebs" "basic-ami" {
  ami_name = "Nodejs-ami"
  instance_type = "t3a.micro"
  ssh_username  =  "ubuntu"
  source_ami = "ami-0d5bf08bc8017c83b"
  region = "us-east-2"
  access_key = ""
  secret_key = ""
}
build {

  sources = ["source.amazon-ebs.basic-ami"]

  provisioner "shell" {
  script = "./script.sh"
  }
}