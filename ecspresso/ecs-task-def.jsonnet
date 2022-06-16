{
  containerDefinitions: [
    {
      cpu: 0,
      environment: [],
      essential: true,
      image: '{{ must_env `IMAGE_TAG` }}',
      memoryReservation: 64,
      mountPoints: [],
      name: 'discordMusicLinkConverter',
      portMappings: [],
      secrets: [
        {
          name: 'DISCORD_TOKEN',
          valueFrom: '{{ tfstate `aws_ssm_parameter.discord_token.arn` }}',
        },
        {
          name: 'DISCORD_ID',
          valueFrom: '{{ tfstate `aws_ssm_parameter.discord_id.arn` }}',
        },
      ],
      volumesFrom: [],
    },
  ],
  executionRoleArn: '{{ tfstate `aws_iam_role.bot_task_execution_role.arn` }}',
  family: 'discordMusicLinkConverter',
  networkMode: 'awsvpc',
  placementConstraints: [],
  requiresCompatibilities: [
    'EC2',
  ],
  taskRoleArn: '{{ tfstate `aws_iam_role.bot_task_role.arn` }}',
  volumes: [],
}
