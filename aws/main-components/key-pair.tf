resource "tls_private_key" "default-key" {
  algorithm = "RSA"
}

module "key_pair" {
  source = "terraform-aws-modules/key-pair/aws"

  key_name   = "wf-key-1"
  public_key = tls_private_key.default-key.public_key_openssh
}