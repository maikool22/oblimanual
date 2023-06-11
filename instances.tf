# Creamos dos intancias

resource "aws_instance" "oblimanual-inst1" {
  ami                    = var.ami-id
  instance_type          = "t2.micro"
  key_name               = "vockey"
  subnet_id              = aws_subnet.oblimanual-subnet1-publica.id
  vpc_security_group_ids = [aws_security_group.oblimanual-sg.id]
  tags = {
    Name = "oblimanual-inst1"
  }
}

resource "aws_instance" "oblimanual-inst2" {
  ami                    = var.ami-id
  instance_type          = "t2.micro"
  key_name               = "vockey"
  subnet_id              = aws_subnet.oblimanual-subnet2-publica.id
  vpc_security_group_ids = [aws_security_group.oblimanual-sg.id]
  tags = {
    Name = "oblimanual-inst2"
  }
}


/*
connection {
  type        = "ssh"
  user        = "ec2-user"
  host        = self.public_ip
  private_key = file("/Users/maikool/downloads/vockey.pem")
}

# Dejamos prontos los servicio de git y httpd

provisioner "remote-exec" {
  inline = [
    "sudo yum install -y httpd git", # -y lo que hace es no pedir confirmacion, instalo httpd y git
    "sudo systemctl start httpd",    # arranco el servicio httpd
    "sudo systemctl start httpd"     # dejo habilitado el servicio httpd

  ]
}

*/