resource "aws_s3_bucket" "dnb-s3-dev" {
  bucket = "dnb-s3-dev"
  acl    = "public-read"

  tags = {
    Name = "dnb-s3-dev"
  }
}
  


resource "aws_s3_bucket_policy" "dnb-s3-policy" {
  bucket = aws_s3_bucket.dnb-s3-dev.id


  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "PublicReadGetObject",
        "Effect" : "Allow",
        "Principal" : "*",
        "Action" : [
          "s3:GetObject"
        ],
        "Resource" : [
          "arn:aws:s3:::dnb-s3-dev/*"
        ]

      }
    ]
  })
}
