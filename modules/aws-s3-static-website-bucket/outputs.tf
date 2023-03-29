output "arn" {
	description = "ARN of the bucket"
	value       = join("", aws_s3_bucket.terraform_s3_bucket.*.arn)
}

output "name" {
	description = "Name of the bucket"
	value       = join("", aws_s3_bucket.terraform_s3_bucket.*.id)
}

