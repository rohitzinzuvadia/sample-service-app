terraform {
  backend "s3" {
  }
}
provider "aws" {
  region = "${var.region}"
}

module "ecs_service" {
  source = "./modules/service"
}
