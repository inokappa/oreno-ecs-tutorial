#
# AWS Launch EC2 instance
#
resource "aws_instance" "oreno_tf_test" {
  count = 1
  instance_type = "${var.instance_type}"
  ami = "${lookup(var.aws_amis, var.region)}"
  subnet_id = "${var.subnet}"
  associate_public_ip_address = true
  vpc_security_group_ids = ["${var.securiy_group}"]
  iam_instance_profile = "${aws_iam_role_policy.ecs_iam_role.name}"
  key_name = "${var.ssh_key_name}"
  tags = {
    Name = "${lookup(var.tag_names, count.index)}"
  }
  user_data = <<EOT
#!/usr/bin/env bash
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list
apt-get update
apt-get install -y docker-engine
mkdir -p /var/log/ecs
mkdir -p /var/lib/ecs/data

docker run --name ecs-agent \
--detach=true \
--restart=on-failure:10 \
--volume=/var/run/docker.sock:/var/run/docker.sock \
--volume=/var/log/ecs/:/log \
--volume=/var/lib/ecs/data:/data \
--volume=/sys/fs/cgroup:/sys/fs/cgroup:ro \
--volume=/var/run/docker/execdriver/native:/var/lib/docker/execdriver/native:ro \
--publish=127.0.0.1:51678:51678 \
--env=ECS_LOGFILE=/log/ecs-agent.log \
--env=ECS_LOGLEVEL=info \
--env=ECS_DATADIR=/data \
--env=ECS_CLUSTER="${aws_ecs_cluster.oreno_ecs_cluster.name}" \
amazon/amazon-ecs-agent:latest
EOT
}
