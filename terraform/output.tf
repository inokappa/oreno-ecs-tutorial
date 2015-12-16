output "EC2 IP address" {
    value = "${aws_instance.oreno_tf_test.public_ip}"
}

output "EC2 Instance ID" {
    value = "${aws_instance.oreno_tf_test.id}"
}

output "ECS Cluster Name" {
    value = "${aws_ecs_cluster.oreno_ecs_cluster.name}"
}

