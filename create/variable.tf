// AWS region
variable region {
  type = string
  description = "Deploy in Asia Pacific (Singapore) Region"
  default = "ap-southeast-1"
}

// EBS root volume size

variable "ec2_volume_size" {
    type = number
    description = "EC2 EBS volume size"
    default = "50"
}

variable "public_key" {
    type = string
    description = "ssh public key"
    default = "Top Secret Key"
    sensitive = true
}

// Variables for EC2
variable "private_ip_address" {
  type = string
  description = "IP address of your own device to allow SSH access"
}

variable "ec2_ami" {
  type = string
  description = "AMI to launch"
}

variable "ec2_instance_type" {
  type = string
  description = "EC2 Instance type to launch"
}