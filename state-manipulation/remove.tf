removed {
  from = aws_s3_bucket.my-bucket

  lifecycle {
    destroy = true
  }
}

resource "aws_s3_bucket" "my-bucket" {
  bucket = "random-name-19236491asda"
}

