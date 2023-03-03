module "my_lambda_layer" {
  source = "./lambda-layer-module"

  layer_name      = "my-layer"
  s3_bucket_name  = "my-bucket"
  s3_key_prefix   = "path/to/my-layer"

}

output "my_lambda_layer_arn" {
  value = module.my_lambda_layer.layer_arn
}
