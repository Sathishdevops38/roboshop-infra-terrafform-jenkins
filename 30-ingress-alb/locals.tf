locals {
  alb_name= "${var.project_name}-${var.environment}-frontend-alb" 
  tg_name = "${var.project_name}-${var.environment}-frontend-alb-tg" 
  ingress_lb_sg_id = data.aws_ssm_parameter.ingress_lb_sg_id.value
  public_subnet_id = split("," , data.aws_ssm_parameter.public_subnet_ids.value)[*]
  vpc_id= data.aws_ssm_parameter.vpc_id.value
  ingress_alb_certificate_arn = data.aws_ssm_parameter.ingress_alb_certificate_arn.value
  common_tags = {
    Project = var.project_name
    Environment = var.environment
    Terraform = "true"
    }
}