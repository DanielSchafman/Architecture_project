provider "aws" {
  region = "us-east-1"
  access_key = var.access_key_id
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

resource "aws_instance" "mysql-client" {
  ami           = "ami-0e86e20dae9224db8"
  instance_type = "t2.micro"
  key_name      = "beanstalk-key"

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
