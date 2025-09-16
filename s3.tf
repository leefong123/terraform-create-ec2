backend "s3" {
    bucket = "terraform-create-ec2-state-bucket-2025"   
    key    = "terraform-create-ec2.tfstate"   
    region = ""                 
  }
}
