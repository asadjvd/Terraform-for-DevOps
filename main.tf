
module "dev-infra" {
    source = "./infra-app"
    env = "dev"
    bucket_name = "tf-infra-app-bucket-asad"
    instance_count = 1
    instance_type = "t2.micro"
    ec2_ami_id = "ami-0f5fcdfbd140e4ab7" 
    hash_key = "studentID"
}

module "prd-infra" {
    source = "./infra-app"
    env = "prd"
    bucket_name = "tf-infra-app-bucket-asad"
    instance_count = 3
    instance_type = "t2.micro"
    ec2_ami_id = "ami-0f5fcdfbd140e4ab7" 
    hash_key = "studentID"
}

module "stg-infra" {
    source = "./infra-app"
    env = "stg"
    bucket_name = "tf-infra-app-bucket-asad"
    instance_count = 2
    instance_type = "t2.micro"
    ec2_ami_id = "ami-0f5fcdfbd140e4ab7" 
    hash_key = "studentID"
}