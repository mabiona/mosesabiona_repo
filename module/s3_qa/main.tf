resource "aws_s3_bucket" "dnb-s3-qa" {
  bucket = "dnb-s3-qa"
  acl    = "public-read"

  tags = {
    Name = "dnb-s3-qa"
  }
}
  


resource "aws_s3_bucket_policy" "dnb-s3-policy" {
  bucket = aws_s3_bucket.dnb-s3-qa.id


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
          "arn:aws:s3:::dnb-s3-qa/*"
        ]

      }
    ]
  })
}