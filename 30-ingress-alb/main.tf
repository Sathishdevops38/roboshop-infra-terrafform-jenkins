module "ingress_alb" {
  source = "git::https://github.com/Sathishdevops38/terraform-modules.git//30-alb-module?ref=main"
  name = local.alb_name
  project_name = var.project_name
  environment = var.environment
  security_groups = local.ingress_lb_sg_id
  subnets = local.public_subnet_id
  alb_tags = var.alb_tags
  load_balancer_type = var.load_balancer_type

  #tg config
  tg_name = local.tg_name
  target_type = var.target_type
  tg_port = var.port
  tg_protocol = var.protocol
  vpc_id = local.vpc_id
  alb_tg_tags = var.alb_tg_tags
}

resource "aws_lb_listener" "ingress_alb" {
  load_balancer_arn = module.ingress_alb.alb_arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-3-2021-06"
  certificate_arn   = local.ingress_alb_certificate_arn

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<h1>Hi, I am from HTTPS frontend ALB</h1>"
      status_code  = "200"
    }
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = var.zone_id
  name    = "*.${var.domain_name}" # *.daws38sat.fun
  type    = "A"
  alias {
    name                   = module.ingress_alb.alb_dns_name
    zone_id                = module.ingress_alb.alb_zone_id
    evaluate_target_health = true
  }
}

