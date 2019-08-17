variable "region" {}

variable "amis" {
 type            = "map"
 default = {
  "us-east-1"    = "ami-0a84a2cca408f2520"
  "us-east-2"    = "ami-02f706d959cedf892"
 }
}

