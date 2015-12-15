#
# Credentials for test
variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "ap-northeast-1"
}

# SSH key
variable "ssh_key_name" {}

# 
variable "aws_amis" {
  default = {
      "ap-northeast-1" = "ami-936d9d93"
  }
}

# Instance Type
variable "instance_type" {
  default = "t2.micro"
}


# Instance Tag Name
variable "tag_names" {
  default = {
    "0" = "ecs-container-instance01"
  }
}

# Subnet
variable "subnet" {}

# SecurityGroup
variable "securiy_group" {}
