output "website_bucket_arn" {
  description = "ARN of the bucket"
  value       = module.website_s3_bucket.*.arn
}

output "website_bucket_name" {
  description = "Name of the bucket"
  value       = module.website_s3_bucket.*.name
}

output "aws_instance_id" {
  description = "ID of AWS instance"
  value       = aws_instance.terraform-instance.id
}
