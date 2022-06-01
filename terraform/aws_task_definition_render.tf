resource "local_file" "ecs_task_definition" {
  filename = "${path.module}/ecs-task-definition.json"
  content = local.task_definition
}
