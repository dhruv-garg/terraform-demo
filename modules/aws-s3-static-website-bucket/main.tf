resource "aws_s3_bucket" "terraform_s3_bucket" {
	bucket = var.bucket_name
	tags   = var.tags
}

resource "aws_s3_bucket_website_configuration" "terraform_s3_bucket" {
	bucket = aws_s3_bucket.terraform_s3_bucket.id
	index_document {
		suffix = "index.html"
	}
	error_document {
		key = "error.html"
	}
}

resource "aws_s3_bucket_acl" "terraform_s3_bucket" {
	bucket = aws_s3_bucket.terraform_s3_bucket.id
	acl    = "public-read"
}
