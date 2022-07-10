module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = format("%s-%s", local.tags.env, local.tags.org_name)

  ami                    = local.ec2.ami
  instance_type          = local.ec2.instance_type
  key_name               = local.ec2.key_name
  iam_instance_profile   = local.ec2.iam_profile
  vpc_security_group_ids = ["${aws_security_group.expose_web.id}"]
  monitoring             = true

  tags = local.tags
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_security_group" "expose_web" {
  name        = "expose_web"
  description = "Allow SSH & Web inbound traffic"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
