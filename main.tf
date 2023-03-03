module "my_lambda_layer" {
  source = "./modules/layer"

  layer_name      = "my-layer"
  s3_bucket_name  = "bskhatrig-testing"
  s3_key_prefix   = "layers/my-layer"

}

output "my_lambda_layer_arn" {
  value = module.my_lambda_layer.layer_arn
}
