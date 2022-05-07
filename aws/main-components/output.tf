output "ec2_ids" {
  description = "List of IDs of instances"
  value       = module.ec2_instance.id
}

output "ec2_arn" {
  description = "List of IDs of t2-type instances"
  value       = module.ec2_instance.arn
}

output "public_dns" {
  description = "List of public DNS names assigned to the instances"
  value       = module.ec2_instance.public_dns
}

output "instance_public_dns" {
  description = "Public DNS name assigned to the EC2 instance"
  value       = module.ec2_instance.public_dns
}

output "instange_public_ip" {
  description = "Public IP address assigned to the EC2 instance"
  value       = module.ec2_instance.public_ip
}

output "instance_state" {
  description = "State of the EC2 instance"
  value       = module.ec2_instance.instance_state
}

output "exposed_ports" {
  description = "List of exposed ports"
  value       = resource.aws_security_group.expose_web.ingress
}

output "domain-public-zone-id" {
  value = aws_route53_zone.zone.zone_id
}

output "domain-name-servers" {
  value = aws_route53_zone.zone.name_servers
}

output "key_pair_fingerprint" {
  value       = module.key_pair.key_pair_fingerprint
  description = "Key pair fingerprint"
}

output "key_pair_name" {
  value       = module.key_pair.key_pair_key_name
  description = "Key pair name"
}

output "key_pair_id" {
  value       = module.key_pair.key_pair_key_pair_id
  description = "Key pair ID"
}
