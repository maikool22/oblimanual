#Creamos alb 

resource "aws_lb" "oblimanual-alb" {
  name               = "oblimanual-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.oblimanual-sg.id]
  subnets            = [aws_subnet.oblimanual-subnet1-publica.id, aws_subnet.oblimanual-subnet2-publica.id]
 # depends_on         = [aws_vpc.aws_vpc.oblimanual] # Se agrega dependencia para que el alb se cree luego del vpc
}

# Creamos Listener

resource "aws_lb_listener" "oblimanual-listener" {
  load_balancer_arn = aws_lb.oblimanual-alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.oblimanual-trg.arn
  }
}

# Creamos target group

resource "aws_lb_target_group" "oblimanual-trg" {
  name     = "oblimanual-trg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.oblimanual.id
}

