provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "mysql-client" {
    ami = "ami-0e86e20dae9224db8"
    instance_type = "t2.micro"
    key_name = "KEY_NAME"

    provisioner "remote-exec" {
        inline = [ 
            "sudo apt-get update -y",
            "sudo apt-get install -y mysql-client git",
            "mkdir -p /var/tmp/architecure_project",
            "cd /var/tmp/architecure_project",
            "git clone https://github.com/DanielSchafman/Architecture_project.git",
            "mysql -h ${aws_db_instance.mudb.endpoint} -p 3306 -u admin -p ${yourDBPassword} < mysql.sql"
         ]


         connection {
           type = "ssh"
           user = "ubuntu"
           private_key = file("~/.ssh/PRIVATE_KEY")
           host = self.public_ip
         }
    }
}