provider "aws" {
  region = "us-east-1"
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
}

variable "rds_endpoint" {
  description = "The endpoint for the MySQL RDS instance"
  type        = string
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

variable "aws_security_group_id" {
  description = "aws security group id"
  type = string
}



resource "aws_instance" "mysql-client" {
  ami           = "ami-0e86e20dae9224db8"
  instance_type = "t2.micro"
  key_name      = "beanstalk-key"


vpc_security_group_ids = [var.aws_security_group_id]

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install -y mysql-client git",
      "cd /var/tmp/",
      "git clone https://github.com/DanielSchafman/Architecture_project.git",
      "cd /var/tmp/Architecture_project",
      "mysql -h ${var.rds_endpoint} -P 3306 -u admin -p${var.db_password} < mysql.sql"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("/home/daniel/Downloads/beanstalk-key.pem") #Change to your private key absolute path
      host        = self.public_ip
    }
  }
}
