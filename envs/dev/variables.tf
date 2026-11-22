variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1"
}

variable "zone_name" {
  description = "Route 53 hosted zone"
  type        = string
  default     = "devopshack.click"
}

variable "my_ip" {
  description = "My public IP, e.g. 1.2.3.4/32"
  type        = string
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
}

variable "fake_service_path" {
  description = "Path to fake-service binary"
  type        = string
  default     = "../../bin/fake-service"
}
