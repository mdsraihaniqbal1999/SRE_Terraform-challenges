resource "aws_s3_bucket" "my_bucket" {
  bucket = "terraform-basics-bucket"
  acl    = "private"
}
