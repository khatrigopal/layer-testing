module "my_lambda_layer" {
  source = "./modules/layer"

  layer_name      = "my-layer1"
  s3_bucket_name  = "bskhatrig-testing"
  s3_key_prefix   = "layers/my-layer1"

}

  layer_name      = "my-layer2"
  s3_bucket_name  = "bskhatrig-testing"
  s3_key_prefix   = "layers/my-layer2"

}
output "my_lambda_layer_arn" {
  value = module.my_lambda_layer.layer_arn
}
