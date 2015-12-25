#
# Credentials for test
variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "us-east-1"
}

# SSH key
variable "ssh_key_name" {}

# 
variable "aws_amis" {
  default = {
      "ap-northeast-1" = "ami-936d9d93"
      "us-east-1" = "ami-d05e75b8"
  }
}

# Instance Type
variable "instance_type" {
  default = "t2.nano"
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

# ECS IAM Policy
# following policy attached to IAM role
#{
#  "Version": "2012-10-17",
#  "Statement": [
#    {
#      "Effect": "Allow",
#      "Action": [
#        "ecs:CreateCluster",
#        "ecs:DeregisterContainerInstance",
#        "ecs:DiscoverPollEndpoint",
#        "ecs:Poll",
#        "ecs:RegisterContainerInstance",
#        "ecs:StartTelemetrySession",
#        "ecs:Submit*",
#        "ecr:GetAuthorizationToken",
#        "ecr:BatchCheckLayerAvailability",
#        "ecr:GetDownloadUrlForLayer",
#        "ecr:BatchGetImage"
#      ],
#      "Resource": "*"
#    }
#  ]
#}
variable "ecs_iam_policy_arn" {
  default = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

variable "ecr_repository_arn" {}
