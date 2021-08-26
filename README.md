# mosesabiona_repo
Infrastructure completed
Internet gateway was not attached to the public route table, hence the ec2 instance cant be reached. lot of troubleshoot was done to git it all sorted, however time constraint wouldn't allow.
Note, for the config.tf  to run, an s3 bucket must be created manually first, then pass the name of the s3 into the config.tf in order to backup the terraform.tf state file
ec2 ip, vpc id, subnets id all have an output
The s3 bucket policy were provisioned, however not tested before submission due to time factor. I have some other project running at my current place of work.
If more time is given, I can work on this assessment end to end.
