[
    {
      "name": "wf-app",
      "image": "${app_image}",
      "cpu": ${fargate_cpu},
      "memory": ${fargate_memory},
      "networkMode": "awsvpc",
      "logConfiguration": {
          "logDriver": "awslogs",
          "options": {
            "awslogs-group": "/ecs/wf-app",
            "awslogs-region": "${aws_region}",
            "awslogs-stream-prefix": "ecs"
          }
      },
      "portMappings": [
        {
          "containerPort": ${app_port},
          "hostPort": ${app_port},
          "protocol": "tcp"
        }
      ]
    }
  ]
