#
# Create ECS cluster
#
resource "aws_ecs_cluster" "oreno-cluster" {
  name = "oreno-cluster"
}
