module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.15.0"
  bucket  = "xf-s3-bucket"
  acl     = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "example" {
  bucket = module.s3_bucket.s3_bucket_id
  rule {
    id     = "cleanup"
    status = "Enabled"

    expiration {
      days = 7
    }
  }
}

module "ecr" {
  source = "terraform-aws-modules/ecr/aws"

  repository_name = "devops/nginx"
  repository_image_tag_mutability = "MUTABLE"
  repository_lifecycle_policy = jsonencode({
    rules = [
      {
        rulePriority = 1,
        description  = "Keep last 3 images",
        selection = {
          tagStatus   = "any",
          countType   = "imageCountMoreThan",
          countNumber = 3
        },
        action = {
          type = "expire"
        }
      }
    ]
  })

}
