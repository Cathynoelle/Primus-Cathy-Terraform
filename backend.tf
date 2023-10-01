terraform {
  backend "s3" {
    bucket = "cathy-tf-test-bucket"
    key    = "cathy-march-terraform-state/terraformstatefile"
    #region = "us-east-1"
    dynamodb_table = "terraform-lock"
  }
}
