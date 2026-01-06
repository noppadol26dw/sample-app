# S3 backend with locking
# terraform {
#   backend "s3" {
#     bucket       = "my-terraform-state-bucket"
#     key          = "eks/dev/terraform.tfstate"
#     region       = "ap-southeast-1"
#     use_lockfile = true
#     encrypt      = true
#   }
# }