output "EC2 IP address" {
    value = "${aws_instance.oreno_tf_test.public_ip}"
}

output "EC2 Instance ID" {
    value = "${aws_instance.oreno_tf_test.id}"
}
