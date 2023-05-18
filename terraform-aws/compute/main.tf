# ----compute/main.tf ----

data "aws_ami" "server_ami" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "random_id" "node_id" {
  byte_length = 2
  count       = var.instance_count
  
}

resource "aws_instance" "node" {
  count                   = var.instance_count #1
  instance_type           = var.instance_type  #t3.micro
  disable_api_termination = true
  ami                     = data.aws_ami.server_ami.id
  tags = {
    Name = "node-${random_id.node_id[count.index].dec}"
  }
  vpc_security_group_ids = [var.public_sg]
  subnet_id              = var.public_subnets[count.index]
  root_block_device {
    volume_size = var.vol_size #10
  }
}
