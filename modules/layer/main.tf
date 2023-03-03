provider "aws" {
  region = "us-east-1" # Change to your desired region
}

variable "layer_name" {
  type = string
}

variable "s3_bucket_name" {
  type = string
}

variable "s3_key_prefix" {
  type = string
}

data "archive_file" "layer_zip" {
  type        = "zip"
  source_dir  = "${path.module}/layer"
  output_path = "${path.module}/layer.zip"
}

resource "aws_s3_bucket_object" "layer_zip" {
  bucket = var.s3_bucket_name
  key    = "${var.s3_key_prefix}/${var.layer_name}.zip"
  source = data.archive_file.layer_zip.output_path
}

resource "aws_lambda_layer_version" "layer" {
  layer_name = var.layer_name
  s3_bucket  = var.s3_bucket_name
  s3_key     = "${var.s3_key_prefix}/${var.layer_name}.zip"

  compatible_runtimes = ["python3.8"] # Change to your desired runtime(s)
}

output "layer_arn" {
  value = aws_lambda_layer_version.layer.arn
}
