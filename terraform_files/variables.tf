variable "profile" {
  description = "profile configured using aws creds"
}
variable "region" {
  description = "AWS Region"
}
variable "subnet_az1" {
  description = "AZ 1a with the Region"
}
variable "subnet_az2" {
  description = "AZ 1b with the Region"
}
variable "security_group" {
  description = "aws security group name"
}
variable "vpc_cidr" {
  description = "value of subnet cidr"
  default     = "10.0.0.0/16"
}
variable "public-subnet-1" {
  description = "value of cider for public-subnet-1"
}
variable "private-subnet-1" {
  description = "value of cider for private-subnet-1"
}
variable "public-subnet-2" {
  description = "value of cider for public-subnet-2"
}
variable "private-subnet-2" {
  description = "value of cider for private-subnet-2"
}
variable "db_username" {
  description = "The database admin username"
  type        = string
}

variable "db_password" {
  description = "The database admin password"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "The name of the database"
  type        = string
}

variable "cloudwatch_group" {
  description = "cloudwatch for logs"
  type        = string
}