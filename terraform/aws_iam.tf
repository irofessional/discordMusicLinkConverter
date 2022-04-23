data "aws_iam_policy_document" "task_role" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }

}

#タスク実行ロールの定義

data "aws_iam_policy_document" "execution" {
  statement {
    actions = [
      "ssm:GetParameters",
      "ssm:DescribeParameters",
      "ecr:GetAuthorizationToken",
      "ecr:BatchCheckLayerAvailability",
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    resources = [
      "*"
    ]
    effect = "Allow"
  }
}

resource "aws_iam_policy" "task_execution" {
  name   = "${local.prefix}-TaskExecution"
  policy = data.aws_iam_policy_document.execution.json
}

resource "aws_iam_role" "bot_task_execution_role" {
  name               = "${local.prefix}-TaskExecutionRole"
  assume_role_policy = data.aws_iam_policy_document.task_role.json
}

resource "aws_iam_role_policy_attachment" "bot_task_execution" {
  role       = aws_iam_role.bot_task_execution_role.name
  policy_arn = aws_iam_policy.task_execution.arn
}

#タスクロールの定義
data "aws_iam_policy_document" "task_role_doc" {
  statement {
    actions = [
      "cloudwatch:*",
    ]
    resources = [
      "*"
    ]
    effect = "Allow"
  }
}

resource "aws_iam_policy" "task_policy" {
  name   = "${local.prefix}-TaskPolicy"
  policy = data.aws_iam_policy_document.task_role_doc.json
}

resource "aws_iam_role" "bot_task_role" {
  name               = "${local.prefix}-TaskRole"
  assume_role_policy = data.aws_iam_policy_document.task_role.json
}

resource "aws_iam_role_policy_attachment" "bot_task" {
  role       = aws_iam_role.bot_task_role.name
  policy_arn = aws_iam_policy.task_policy.arn
}