#
# Create CloudWatch Logs Log Group
#
resource "aws_cloudwatch_log_group" "oreno_cw_log" {
  name = "docker-logging"
}
