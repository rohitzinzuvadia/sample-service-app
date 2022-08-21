variable "env" {
    default = "dev"
}
variable "serviceName" {
    default = "sample-ecs-task"
}
variable "ecrPath" {
    default = "635489002009.dkr.ecr.ap-south-1.amazonaws.com/spring-boot-sample-app"
}
variable "desiredCount" {
  default = 1
}
variable "region" {
    default =  "ap-south-1"
}