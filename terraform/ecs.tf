#
# Create ECS cluster
#
resource "aws_ecs_cluster" "oreno_ecs_cluster" {
  name = "oreno-cluster"
}
