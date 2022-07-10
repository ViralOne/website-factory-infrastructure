resource "tls_private_key" "private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "wf_pair_key" {
  key_name   = local.ec2.key_name
  public_key = tls_private_key.private_key.public_key_openssh

  provisioner "local-exec" { # Create a "<FILE>.pem" on the local machine
    command = "echo '${tls_private_key.private_key.private_key_pem}' > ./<FILE>.pem"
  }
}

# Set <FILE>.pem as file only readable by the current user before ssh to the EC2 instance
# chmod 400 <FILE>.pem
