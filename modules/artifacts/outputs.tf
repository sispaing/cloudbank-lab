output "fake_service_url" {
  description = "fake-service download URL"
  value       = "https://${aws_s3_bucket.artifacts.bucket_regional_domain_name}/${aws_s3_object.fake_service.key}"

  depends_on = [aws_s3_object.fake_service, aws_s3_bucket_policy.artifacts]
}

output "bucket_name" {
  value = aws_s3_bucket.artifacts.id
}
