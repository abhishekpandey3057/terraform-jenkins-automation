module "vpc" {
  source     = "./modules/vpc-network"
  cidr_block = "10.0.0.0/16"
}

module "web_server" {
  source          = "./modules/ec2-instance"
  ami_id          = "ami-0c55b159cbfafe1f0"
  instance_type   = "t3.micro"
  subnet_id       = module.vpc.public_subnet_id
  security_groups = [module.vpc.security_group_id]
}

module "data_bucket" {
  source      = "./modules/s3-bucket"
  bucket_name = "app-data-bucket-${random_id.suffix.hex}"
}

resource "random_id" "suffix" {
  byte_length = 4
}
