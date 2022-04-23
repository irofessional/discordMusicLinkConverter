resource "github_actions_secret" "task_execution_role" {
  secret_name = "AWS_taskExecutionRoleArn"
  repository  = var.github_repo_name
  plaintext_value = aws_iam_role.bot_task_execution_role.arn
}

resource "github_actions_secret" "task_role" {
  secret_name = "AWS_taskRoleArn"
  repository  = var.github_repo_name
  plaintext_value = aws_iam_role.bot_task_role.arn
}

resource "github_actions_secret" "discord_token_arn" {
  secret_name     = "AWS_DISCORD_BOT_TOKEN_ARN"
  repository      = var.github_repo_name
  plaintext_value = aws_ssm_parameter.discord_bot_token.arn
}

resource "github_actions_secret" "discord_category_id_arn" {
  secret_name     = "AWS_DISOCRD_CATEGORY_ID_ARN"
  repository      = var.github_repo_name
  plaintext_value = aws_ssm_parameter.discord_category_id.arn
}
