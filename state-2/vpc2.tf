#
#
#variable "cidr_list2" {
##  type = list
##  default = ["10.0.0.0/17", "10.0.128.0/17"]
#  default = "172.32.0.0/17"
#
#
#}
#
#resource "aws_subnet" "main2" {
##  for_each = toset(var.cidr_list)
##  toset converts the list into a set which is suitable for for.each
#  vpc_id     = aws_vpc.test2.id
#  cidr_block = var.cidr_list2
#
#  tags = {
#    Name = var.name2
#  }
#}
#resource "aws_network_interface" "foo2" {
## for_each = toset(var.cidr_list)
#  subnet_id   = aws_subnet.main2.id
##  private_ips = ["172.16.10.100"]
#  private_ips = ["172.32.0.5"]
#
#  tags = {
#    Name = "primary_network_interface"
#  }
#}
#
#
#
#resource "aws_instance" "foo2" {
##  for_each = toset(var.cidr_list)
#  ami           = data.aws_ami.ubuntu.id
#  instance_type = "t2.micro"
#
#  network_interface {
#    network_interface_id = aws_network_interface.foo2.id
#    device_index         = 0
#  }
#
#  credit_specification {
#    cpu_credits = "unlimited"
#  }
#   tags = {
#    Name = var.name2
#  }
#}