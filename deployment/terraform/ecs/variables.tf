variable "env" {
    default = "dev"
}
variable "cluster" {
    default = "non-prod-001"
}
variable "serviceName" {
    default = "sample-service-app"
}
variable "desiredCount" {
  default = 1
}
variable "ecrPath" {
    default = "635489002009.dkr.ecr.ap-south-1.amazonaws.com/sample-service-app"
}
variable "region" {
    default =  "ap-south-1"
}
variable "subnet1" {
  default = "subnet-233ed048"
}
variable "subnet2" {
  default = "subnet-295e0165"
}
variable "subnet3" {
  default = "subnet-3121404a"
}
variable "securityGroup" {
  default = "sg-135a946e"
}