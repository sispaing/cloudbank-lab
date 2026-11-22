# app servers have no internet, so they download fake-service from s3 through the vpc endpoint

resource "aws_s3_bucket" "artifacts" {
  bucket_prefix = var.bucket_prefix
  force_destroy = true

  tags = { Name = "cloudbank-artifacts" }
}

resource "aws_s3_object" "fake_service" {
  bucket = aws_s3_bucket.artifacts.id
  key    = "fake-service"
  source = var.fake_service_path
  etag   = filemd5(var.fake_service_path)
}

resource "aws_vpc_endpoint" "s3_cp" {
  vpc_id            = var.customer_profile_vpc_id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = var.customer_profile_route_table_ids

  tags = { Name = "cp-s3-endpoint" }
}

resource "aws_vpc_endpoint" "s3_acc" {
  vpc_id            = var.account_vpc_id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = var.account_route_table_ids

  tags = { Name = "acc-s3-endpoint" }
}

resource "aws_vpc_endpoint" "s3_stmt" {
  vpc_id            = var.statement_vpc_id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = var.statement_route_table_ids

  tags = { Name = "stmt-s3-endpoint" }
}

resource "aws_s3_bucket_policy" "artifacts" {
  bucket = aws_s3_bucket.artifacts.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "AllowReadFromLabVpcEndpoints"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.artifacts.arn}/*"
        Condition = {
          StringEquals = {
            "aws:SourceVpce" = [
              aws_vpc_endpoint.s3_cp.id,
              aws_vpc_endpoint.s3_acc.id,
              aws_vpc_endpoint.s3_stmt.id,
            ]
          }
        }
      }
    ]
  })
}
