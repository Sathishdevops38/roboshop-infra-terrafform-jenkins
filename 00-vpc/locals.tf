locals{
    default_vpc = data.aws_vpc.default_vpc.id
    default_subnet = data.aws_subnet.default_subnet.id
    default_sg = data.aws_security_group.default_sg.id
    default_rt = data.aws_route_table.main.id
}