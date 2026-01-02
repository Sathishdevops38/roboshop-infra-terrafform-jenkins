resource "aws_ssm_parameter" "vpc_id" {
  name  = "/${var.project_name}/${var.environment}/vpc_id"
  type  = "String"
  value = module.this.vpc_id
}

resource "aws_ssm_parameter" "default_vpc_id" {
  name  = "/${var.project_name}/${var.environment}/default_vpc_id"
  type  = "String"
  value = local.default_vpc
}

resource "aws_ssm_parameter" "default_subnet_id" {
  name  = "/${var.project_name}/${var.environment}/default_subnet_id"
  type  = "String"
  value = local.default_subnet
}

resource "aws_ssm_parameter" "default_sg_id" {
  name  = "/${var.project_name}/${var.environment}/default_sg_id"
  type  = "String"
  value = local.default_sg
}


resource "aws_ssm_parameter" "public_subnet_ids" {
  name  = "/${var.project_name}/${var.environment}/public_subnet_ids"
  type  = "StringList"
  value = join("," , module.this.public_id)
}

resource "aws_ssm_parameter" "private_subnet_ids" {
  name  = "/${var.project_name}/${var.environment}/private_subnet_ids"
  type  = "StringList"
  value = join("," , module.this.private_id)
}

resource "aws_ssm_parameter" "database_subnet_ids" {
  name  = "/${var.project_name}/${var.environment}/database_subnet_ids"
  type  = "StringList"
  value = join("," , module.this.database_id)
}

