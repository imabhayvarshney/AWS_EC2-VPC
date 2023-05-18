# --root/main---

module "networking" {
  source           = "./networking"
  vpc_cidr         = local.vpc_cidr
  security_groups  = local.security_groups
  #public_sn_count  = 2 
  public_sn_count  = var.aws_public_subnet_ids
  #private_sn_count = 3 
  private_sn_count =  var.aws_private_subnet_ids
  max_subnets      = var.mx_sb
  public_cidrs     = [for i in range(2, 255, 2) : cidrsubnet(local.vpc_cidr, 8, i)]
  private_cidrs    = [for i in range(1, 255, 2) : cidrsubnet(local.vpc_cidr, 8, i)]
  
}


module "compute" {
  source              = "./compute"
  public_sg           = module.networking.public_sg
  public_subnets      = module.networking.public_subnets
  instance_count      = 2
  instance_type       = "t3.micro"
  vol_size            = 10
 
  
}

