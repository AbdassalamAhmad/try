#---------------- EC2 Variables ---------------------

variable "ami" {
  type = string
  #sensitive = true
}

variable "ec2_type" {
  type = string
}

variable "public_key" {
  sensitive = true
}