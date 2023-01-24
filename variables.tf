#---------------- EC2 Variables ---------------------
variable "ec2_type" {
  type = string
}

variable "public_key" {
  sensitive = true
}

variable "key_name" {
  
}