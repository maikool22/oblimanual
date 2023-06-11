#Creamos alb 
resource "aws_lb" "oblimanual-alb" {
  name               = "oblimanual-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.oblimanual-sg]
  subnets            = [aws_subnet.oblimanual-subnet1-publica.id, aws_subnet.oblimanual-subnet2-publica.id]
}

