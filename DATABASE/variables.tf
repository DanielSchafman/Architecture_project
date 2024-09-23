
variable "db_username" {
  type = string
}

variable "db_password" {
  description = "The password for the MySQL database"
  type        = string
  sensitive   = true
}


variable "aws_access_key_id"{
  description = "aws access key"
  type = string
  sensitive = true
}

variable "aws_secret_access_key" {
  description = "aws_secret_access_key"
  type = string
  sensitive = true
}

# variable "aws_security_group_id" {
#   description = "aws security group id"
#   type = string
# }
