provider "aws" {
 region          = var.region
 profile         = "default"
} 

resource "aws_s3_bucket" "ex_bucket" {
 bucket          = "s3-markova"
 acl             = "private"
}

resource "aws_instance" "example" {
 ami             = "${lookup(var.amis,var.region)}" 
 instance_type   = "t2.micro"
 depends_on      = ["aws_s3_bucket.ex_bucket"]

 provisioner "local-exec" {
   command       = "echo ${aws_eip.eip_example.id} > local_file.txt"
   on_failure    = "continue"
 }
}

resource "aws_eip" "eip_example" {

}

output "inst_ip" {
  value          = aws_instance.example.public_ip
}

