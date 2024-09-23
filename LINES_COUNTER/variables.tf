
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
variable "table_name" {}
variable "hash_key" {}
variable "hash_key_type" {}
variable "billing_mode" { default = "PAY_PER_REQUEST" }
variable "handler" {}
variable "runtime" {}
variable "filename" {}
variable "function_name" {}
variable "bucket_name" {}
variable "bucket_acl" {
  default = "private"
}