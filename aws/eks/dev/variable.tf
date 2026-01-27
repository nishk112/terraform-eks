variable "cluster_name" {}

variable "cluster_version" {
  description = "EKS cluster version"
  type        = string
}

variable "endpoint_public_access" {
  description = "Enable public endpoint access"
  type        = bool
}

variable "endpoint_private_access" {
  description = "Enable private endpoint access"
  type        = bool
}
variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

