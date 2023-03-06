module "my_lambda_layer1" {
  source = "./modules/layer"

  layer_name      = "my-layer1"
  s3_bucket_name  = "bskhatrig-testing"
  s3_key_prefix   = "layers/my-layer1"

}

 module "my_lambda_layer2" {
  source = "./modules/layer"
   
  layer_name      = "my-layer2"
  s3_bucket_name  = "bskhatrig-testing"
  s3_key_prefix   = "layers/my-layer2"

}
output "my_lambda_layer1_arn" {
  value = module.my_lambda_layer1.layer_arn
}
  
output "my_lambda_layer2_arn" {
  value = module.my_lambda_layer1.layer_arn
}
