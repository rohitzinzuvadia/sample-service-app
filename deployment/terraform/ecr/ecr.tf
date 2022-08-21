terraform {
  backend "s3" {
  }
}
provider "aws" {
  region = "${var.regionName}"
}

resource "aws_ecr_repository" "spring-boot-sample-app-ecr" {
  name = "${var.serviceName}"
}
output "ecr_repository_name" {
    description = "ECR Repository url"
    value = aws_ecr_repository.spring-boot-sample-app-ecr.repository_url
}