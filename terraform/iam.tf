#
# Create IAM Instance Profile
#
resource "aws_iam_instance_profile" "ecs_iam_role" {
    name = "ecs_iam_role"
    roles = ["${aws_iam_role.ecs_iam_role.name}"]
}

#
# Create IAM role
#
resource "aws_iam_role" "ecs_iam_role" {
    name = "ecs_iam_role"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

#
# Attach Managed Policy
#
resource "aws_iam_policy_attachment" "ecs-role-attach" {
    name = "ecs-role-attach"
    roles = ["${aws_iam_role.ecs_iam_role.name}"]
    policy_arn = "${var.ecs_iam_policy_arn}"
}

# 
# Create IAM role Policy
#
resource "aws_iam_role_policy" "cwlogs_iam_role_policy" {
    name = "cwlogs_iam_role_policy"
    role = "${aws_iam_role.ecs_iam_role.id}"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}
