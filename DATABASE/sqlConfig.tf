resource "null_resource" "wait_for_rds" {
  provisioner "local-exec" {
    command = "sleep 30"
  }
}

resource "null_resource" "init_db" {
  depends_on = [null_resource.wait_for_rds]

  provisioner "local-exec" {
    command = <<EOT
        mysql -h ${aws_db_instance.myrds.endpoint} -u ${var.db_username} -p${var.db_password} < mysql.sql
    EOT
  }
}