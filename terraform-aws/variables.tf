# --root/variables.tf --

variable "aws_region" {
  default = "us-east-1"
}

variable "aws_public_subnet_ids"{
  #default = 2
  validation {
    condition = var.aws_public_subnet_ids > 1
    error_message = "This application requires at least two public subnets."

 }
}
variable "aws_private_subnet_ids"{
  #default = 2
  validation {
    condition = var.aws_private_subnet_ids > 1
    error_message = "This application requires at least two public subnets."

 }
}

variable "mx_sb"{
  default = 20
}
