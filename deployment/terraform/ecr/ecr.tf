terraform {
  backend "s3" {
  }
}
provider "aws" {
  region = "${var.regionName}"
}

resource "aws_ecr_repository" "sample-service-app-ecr" {
  name = "${var.serviceName}"
}
output "ecr_repository_name" {
    description = "ECR Repository url"
    value = aws_ecr_repository.sample-service-app-ecr.repository_url
}