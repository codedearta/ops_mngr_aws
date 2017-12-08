provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_instance" "mongo_1" {
  ami           = "ami-fcc4db98"
  instance_type = "t2.micro"

  provisioner "local-exec" {
    command = "echo ${aws_instance.mongo_1.public_ip} > ip_address.txt"
  }
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.mongo_1.id}"
}
