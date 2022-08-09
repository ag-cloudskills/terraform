module "sg_module" {
    source = "../../modules/sg"
  
}

module "ec2module" {
    source = "../../modules/ec2"
    instance_type = "t2.nano"
    vpcsg = [module.sg_module.sg_id]
}