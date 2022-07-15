variable "vpc_name" {
    default = ["TGW-1", "TGW-2"]
}

variable "vpc_cidr_list" {
    type = list
    default = ["10.0.0.0/17", "10.0.128.0/17"]
}

variable "subnet_cidr_list" {
    type = list
    default = ["10.0.1.0/24", "10.0.129.0/24"]
}

resource "aws_vpc" "vpc_test" {
    count = 2
    cidr_block = var.vpc_cidr_list[count.index]
    tags = {
        Name = var.vpc_name[count.index]
    }
}

resource "aws_subnet" "subnet_test" {
    count = 2
    vpc_id = aws_vpc.vpc_test[count.index].id
    cidr_block = var.subnet_cidr_list[count.index]
    tags = {
        Name = var.vpc_name[count.index]
    }
}

# resource "aws_subnet" "main" {
#   for_each = aws_vpc.test
# #  for_each = toset(var.cidr_list)
#   vpc_id     = aws_vpc.test[each.key].id
#   cidr_block = var.cidr_list

# #  tags = {
# #    Name = each.value
# #  }
# }


#resource "aws_network_interface" "foo" {
## for_each = toset(var.cidr_list)
#  subnet_id   = aws_subnet.main.id
##  private_ips = ["172.16.10.100"]
#  private_ips = ["172.31.0.5"]
#
#  tags = {
#    Name = "primary_network_interface"
#  }
#}

#data "aws_ami" "ubuntu" {
#  most_recent = true
#
#  filter {
#    name   = "name"
#    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
#  }
#
#  filter {
#    name   = "virtualization-type"
#    values = ["hvm"]
#  }
#
#  owners = ["099720109477"] # Canonical
#}
#
#resource "aws_instance" "foo" {
##  for_each = toset(var.cidr_list)
#  ami           = data.aws_ami.ubuntu.id
#  instance_type = "t2.micro"
#
#  network_interface {
#    network_interface_id = aws_network_interface.foo.id
#    device_index         = 0
#  }
#
#  credit_specification {
#    cpu_credits = "unlimited"
#  }
#   tags = {
#    Name = var.name
#  }
#}