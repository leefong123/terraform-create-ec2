backend "s3" {
    bucket = "terraform-create-ec2-state-bucket-2025"   # Your manually created bucket
    key    = "terraform-create-ec2.tfstate"   # The path to the state file inside the bucket
    region = "apsouth-region"                 # AWS Region of your S3 bucket and resources
  }
}
