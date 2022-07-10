terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
<<<<<<< HEAD:aws/rds/providers.tf
      version = "4.16.0"
=======
      version = "4.22.0"
>>>>>>> c4c5990a5e0567019b574deaf9b338917359f92e:aws/ec2/providers.tf
    }
  }
}

provider "aws" {
  region = local.aws_region.default
}
