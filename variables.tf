variable "vcl_recv_condition" {
  description = "boolean condition to use to select the backend in vcl_recv"
  type        = "string"
}

variable "backend_name" {
  description = "Identifier for the backend/"
  type        = "string"
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket"
  type        = "string"
}

variable "aws_access_key_id" {
  description = "AWS_ACCESS_KEY_ID required to access the bucket"
  type        = "string"
}

variable "aws_secret_access_key" {
  description = "AWS_SECRET_ACCESS_KEY required to access the bucket"
  type        = "string"
}
