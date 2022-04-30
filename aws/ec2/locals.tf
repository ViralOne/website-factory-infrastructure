locals {
  aws_region = {
    description = "Default AWS region"
    default     = "eu-central-1"
  }

  key_name = {
    description = " SSH keys to connect to EC2 instance"
    default     = "wf-key-1"
  }

  instance_type = {
    description = "EC2 instance type"
    default     = "t2.micro"
  }

  ami = {
    description = "Default image used on EC2 instance"
    default     = "ami-035e90af11365cc27"
  }

  iam_instance = {
    description = "IAM instance profile"
    default     = "s3-wf-access"
  }
}
