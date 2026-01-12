variable "vpc1_cidr" {
  default = "192.168.0.0/16"
}

variable "vpc2_cidr" {
  default = "172.32.0.0/16"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_name" {
  description = "EC2 Key Pair name"
  default     = "mahesh-key"
}
