resource "aws_s3_bucket" "my_bucket" {

  bucket = var.bucket_name

  tags = {

    Name = "Terraform Bucket"

    Environment = "Development"

  }

}

resource "aws_s3_bucket_versioning" "versioning" {

  bucket = aws_s3_bucket.my_bucket.id

  versioning_configuration {

    status = "Enabled"

  }

}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {

  bucket = aws_s3_bucket.my_bucket.id

  rule {

    apply_server_side_encryption_by_default {

      sse_algorithm = "AES256"

    }

  }

}

resource "aws_s3_bucket_public_access_block" "public" {

  bucket = aws_s3_bucket.my_bucket.id

  block_public_acls = true

  ignore_public_acls = true

  block_public_policy = true

  restrict_public_buckets = true

}

resource "aws_s3_bucket_ownership_controls" "ownership" {

  bucket = aws_s3_bucket.my_bucket.id

  rule {

    object_ownership = "BucketOwnerPreferred"

  }

}

resource "aws_s3_bucket_lifecycle_configuration" "lifecycle" {

  bucket = aws_s3_bucket.my_bucket.id

  rule {

    id = "delete-after-30-days"

    status = "Enabled"

    filter {}

    expiration {

      days = 30

    }

  }

}

