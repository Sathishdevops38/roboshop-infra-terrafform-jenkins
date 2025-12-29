variable "project_name" {
  type = string
  default = "roboshop"
}

variable "environment" {
  type = string
  default = "dev"
}

variable "sg_name" {
  default = [
        # databases
        "mongodb", "redis", "mysql", "rabbitmq",
        # bastion
        "bastion",
        # frontend load balancer
        "ingress_lb",
        #vpn sg 
        "openvpn",
        #eks Cp cluster
        "eks_control_plane",
        #eks workernode
        "eks_node"
      ]
}

variable "sg_tags" {
  default = {
    created_by = "terraform"
  }
}

# variable "sg_description" {
#   default = "This sg for app"
# }

