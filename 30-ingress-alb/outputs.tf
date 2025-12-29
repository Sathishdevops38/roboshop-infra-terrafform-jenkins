output "alb_arn" {
  value = module.ingress_alb.alb_arn
}

output "tg_arn" {
  value = module.ingress_alb.tg_arn
}

output "alb_zone_id" {
  value = module.ingress_alb.alb_zone_id
}