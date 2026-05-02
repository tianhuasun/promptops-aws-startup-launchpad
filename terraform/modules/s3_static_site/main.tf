resource "aws_s3_bucket" "static_assets" {
  bucket        = var.bucket_name
  force_destroy = var.force_destroy

  tags = merge(var.tags, {
    Name = var.bucket_name
  })
}

resource "aws_s3_bucket_ownership_controls" "static_assets" {
  bucket = aws_s3_bucket.static_assets.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_public_access_block" "static_assets" {
  bucket = aws_s3_bucket.static_assets.id

  # 中文注释：静态资源桶默认不公开，由 CloudFront OAC/OAI 访问，避免直接暴露 S3。
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "static_assets" {
  bucket = aws_s3_bucket.static_assets.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "static_assets" {
  bucket = aws_s3_bucket.static_assets.id

  versioning_configuration {
    status = var.enable_versioning ? "Enabled" : "Suspended"
  }
}

data "aws_iam_policy_document" "cloudfront_read" {
  count = var.cloudfront_distribution_arn == "" ? 0 : 1

  statement {
    sid     = "AllowCloudFrontReadOnly"
    actions = ["s3:GetObject"]

    resources = [
      "${aws_s3_bucket.static_assets.arn}/*"
    ]

    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values   = [var.cloudfront_distribution_arn]
    }
  }
}

resource "aws_s3_bucket_policy" "cloudfront_read" {
  count = var.cloudfront_distribution_arn == "" ? 0 : 1

  bucket = aws_s3_bucket.static_assets.id
  policy = data.aws_iam_policy_document.cloudfront_read[0].json
}
