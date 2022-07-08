resource "aws_ecs_cluster" "main" {
  name = "cb-cluster"
}

data "template_file" "cb_app" {
  template = file("./template/app.tpl")

  vars = {
    app_image      = local.app.image
    app_port       = local.app.port
    fargate_cpu    = local.fargate.cpu
    fargate_memory = local.fargate.memory
    aws_region     = local.aws_region.default
  }
}

resource "aws_ecs_task_definition" "app" {
  family                   = "wf-app-task"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = local.fargate.cpu
  memory                   = local.fargate.memory
  container_definitions    = data.template_file.cb_app.rendered
}

resource "aws_ecs_service" "main" {
  name            = "cb-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.app.arn
  desired_count   = local.app.count
  launch_type     = "FARGATE"

  network_configuration {
    security_groups  = [aws_security_group.ecs_tasks.id]
    subnets          = aws_subnet.private.*.id
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.app.id
    container_name   = "wf-app"
    container_port   = local.app.port
  }

  depends_on = [aws_lb_listener.front_end, aws_iam_role_policy_attachment.ecs_task_execution_role]
}
