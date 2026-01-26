cluster_name             = "dev-eks"
cluster_version          = "1.29"
endpoint_public_access   = true
endpoint_private_access  = true
vpc_id = "vpc-0abc123"
subnet_ids = [
  "subnet-111",
  "subnet-222"
]