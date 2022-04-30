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

output "instance_id" {
  description = "EC2 instance ID"
  value       = module.ec2_instance.id[0]
}

output "t2_instance_id" {
  description = "EC2 instance ID"
  value       = module.ec2_instance.id[0]
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
