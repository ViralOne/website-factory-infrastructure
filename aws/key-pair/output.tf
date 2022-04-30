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