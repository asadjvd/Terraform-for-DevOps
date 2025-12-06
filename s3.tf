resource "aws_s3_bucket" "remote_s3" {
    bucket = "tf-state-bucket-practice-asad"

    tags = {
        Name = "tf-state-bucket-practice-asad"
    }
}