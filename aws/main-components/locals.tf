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
    default     = "ami-015c25ad8763b2f11"
  }

  iam_profile = {
    description = "IAM instance profile"
    default     = "website-factory-profile"
  }
  
  ses = {
    enabled = true
    domain  = "c4r.com"     # change this
    email   = "ngo@c4r.com" # change this
  }

  domain = {
    record_A = "server.domain-registration.com" # change this
  }
}
