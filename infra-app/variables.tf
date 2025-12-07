variable "env" {
    description = "This is the environment for my infra"
    type = string
}

variable "bucket_name" {
    description = "This is the bucket name for my infra"
    type = string
}

variable "instance_count" {
    description = "This is the number of EC2 instances for my infra"
    type = number
}

variable "instance_type" {
    description = "This is the EC2 instance type for my infra"
    type = string
}

variable "ec2_ami_id" {
    description = "This is the EC2 instance ami id for my infra"
    type = string
}

variable "hash_key" {
    description = "This is the hash key for my dynamodb infra"
    type = string
}