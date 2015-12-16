### make

```
$ make

Makefile for ECS

Usage: make [task]

Tasks:
ecs-up                          ....... ECS Cluster up
ecs-list                        ....... list up ECS Clusters. Require environment variable 'OUTPUT'
ecs-list-container-instances    ....... list up ECS Container instances. Require environment variable 'OUTPUT' and 'ECS_CLUSTER'
ecs-describe-container-instances....... describe ECS Container instances. Require environment variable 'OUTPUT' and 'ECS_CLUSTER' and 'ECS_ARN'
```
