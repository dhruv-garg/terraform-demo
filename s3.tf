resource "aws_s3_bucket" "tf_state_s3" {
  bucket = "dhruvgarg074-state"
}

resource "aws_s3_bucket_acl" "acl" {
  bucket = aws_s3_bucket.tf_state_s3.id
  acl    = "private"
}
