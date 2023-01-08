#---------------- EC2 Variables ---------------------

variable "ami" {
  type = string
  #sensitive = true
}

variable "ec2_type" {
  type = string
  sensitive = true
}