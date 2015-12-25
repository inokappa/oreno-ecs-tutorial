output "EC2 IP address" {
    value = "${aws_instance.oreno_tf_test.public_ip}"

}

output "EC2 Instance ID" {
    value = "${aws_instance.oreno_tf_test.id}"

}

output "ECS Cluster Name" {
    value = "${aws_ecs_cluster.oreno-cluster.name}"
}

output "CloudWatch Logs Log Group Name" {
    value = "${aws_cloudwatch_log_group.oreno_cw_log.name}"
}
