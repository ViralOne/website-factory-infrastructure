resource "tls_private_key" "wf_private_key" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "aws_key_pair" "wf_pair_key" {
  key_name   = "wf-key-1"
  public_key = tls_private_key.wf_private_key.public_key_openssh

  provisioner "local-exec" { # Create a "wf-key-1.pem" on the local machine
    command = "echo '${tls_private_key.wf_private_key.private_key_pem}' > ./wf-key-1.pem"
  }
}

# Set wf-key-1.pem as file only readable by the current user before ssh to the EC2 instance
# chmod 400 wf-key-1.pem
