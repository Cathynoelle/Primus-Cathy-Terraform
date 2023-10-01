/*module "cathy-server" {
  source = "./modules/ec2"
  cathysbn-id = module.network.subnetId
  sg = module.cathy-sg.sg
  key_name = "terraform-key"

}

module "network" {
  source = "./modules/network"
  name = "cathy"
}

module "cathy-vpc" {
  source = "./modules/network"
  vpc_cidr = "10.0.0.0/16"
  name = "cathy"
}

module "cathy-sg" {
  source = "./modules/security"
  cathyvpc-id = module.network.vpc_id
}
*/

module "mytest-vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "mytest-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.0.0/24"]



  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

module "s3_bucket_for_logs" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "my-plgcathy-bucket-com"

  tags = {
    env = "Prod"
    owner = "cathy"
  }
}


