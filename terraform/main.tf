resource "aws_s3_bucket" "demo" {
  bucket = var.bucket_name

  tags = {
    Environment = "dev"
    Project     = "terraform-cicd"
    ManagedBy   = "Terraform"
  }
}