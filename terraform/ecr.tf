#
# Define task
#
resource "aws_ecs_task_definition" "sample01" {
  family = "sample01"
  container_definitions = <<EOS
[
  {
    "environment": [],
    "name": "oreno-jenkins",
    "image": "${var.ecr_repository_arn}",
    "cpu": 0,
    "memory": 256,
    "portMappings": [
      {
          "containerPort": 8080,
          "hostPort": 8080
      }
    ],
    "command": [
    ],
    "essential": true
  }
]
EOS
}
#
# Define Service(as container start)
#
resource "aws_ecs_service" "sample01" {
  name = "sample01"
  cluster = "${aws_ecs_cluster.oreno-cluster.id}"
  task_definition = "${aws_ecs_task_definition.sample01.arn}"
  desired_count = 1
}
