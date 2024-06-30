resource "aws_vpc" "vp1" {
  cidr_block       = "172.120.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "utc-app"
    Team = "wdp"
    env  = "dev"
  }
}



