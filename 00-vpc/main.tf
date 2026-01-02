module "this" {
  source = "git::https://github.com/Sathishdevops38/terraform-modules.git//00-vpc-module?ref=main"
  cidr = var.vpc_cidr
  project_name = var.project_name
  environment = var.environment
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  database_subnet_cidrs = var.database_subnet_cidrs

   is_peering_required = true
}

# 3. Create the VPC Peering Connection resource
# resource "aws_vpc_peering_connection" "robo_default" {
#   vpc_id        = module.this.vpc_id
#   peer_vpc_id   = local.default_vpc
#   # Set to true for same-account peering to automatically accept the request
#   auto_accept   = true 
#   tags = {
#     Name = "Requester-to-Accepter-Peering"
#   }
# }

# # 4. Update the Requester VPC's route table
# # Data source to find the main route table of the requester VPC
# data "aws_route_table" "requester_main" {
#   vpc_id = module.this.vpc_id
#   filter {
#     name   = "association.main"
#     values = ["true"]
#   }
# }

# resource "aws_route" "requester_route" {
#   route_table_id            = module.this.private_rt
#   destination_cidr_block    = var.default_vpc_cidr# Destination is the accepter's CIDR
#   vpc_peering_connection_id = aws_vpc_peering_connection.robo_default.id
# }

# # 5. Update the Accepter VPC's route table
# # Data source to find the main route table of the accepter VPC
# data "aws_route_table" "accepter_main" {
#   vpc_id = local.default_vpc
#   filter {
#     name   = "association.main"
#     values = ["true"]
#   }
# }

# resource "aws_route" "accepter_route" {
#   route_table_id            = local.default_rt
#   destination_cidr_block    = var.vpc_cidr # Destination is the requester's CIDR
#   vpc_peering_connection_id = aws_vpc_peering_connection.robo_default.id
# }
