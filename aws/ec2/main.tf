module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "website-factory"

  ami                  = local.ami.default
  instance_type        = local.instance_type.default
  key_name             = local.key_name.default
  iam_instance_profile = local.iam_instance.default
  monitoring           = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}