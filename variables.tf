#---------------- EC2 Variables ---------------------

variable "ami" {
  type = string
}

variable "ec2_type" {
  type = string
}

variable "public_key" {
  sensitive = true
}

variable "key_name" {
  
}