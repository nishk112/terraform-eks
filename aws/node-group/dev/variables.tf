variable "cluster_name" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}
variable "min_size" {
  default = 1
}
variable "max_size" {
  default = 3
}
variable "instance_type" {
  default = "t3.medium"
 
}
variable "desired_capacity" {
  description = "Desired number of nodes in the node group"
  type        = number
  default     = 2
}
variable "node_group_name" {
  default = "private-node-group"
}