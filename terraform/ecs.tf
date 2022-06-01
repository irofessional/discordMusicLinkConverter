data "aws_ecs_cluster" "cluster" {
  cluster_name = var.ecs_cluster
}

resource "aws_ecs_task_definition" "bot" {
  family                   = "${local.prefix}-prod"
  container_definitions    = local.container_definitions
  task_role_arn            = aws_iam_role.bot_task_execution_role.arn
  execution_role_arn       = aws_iam_role.bot_task_role.arn
  requires_compatibilities = ["EC2"]
}

resource "aws_ecs_service" "bot" {
  name            = "${local.prefix}-prod"
  cluster         = data.aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.bot.arn
  desired_count   = 1
  network_configuration {
    subnets = [
      local.ecs_subnet_id
    ]
  }
}
