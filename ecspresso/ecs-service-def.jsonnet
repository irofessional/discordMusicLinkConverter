{
  capacityProviderStrategy: [
    {
      base: 1,
      capacityProvider: 'polaris-prod-cluster-capacity_provider',
      weight: 1,
    },
  ],
  deploymentConfiguration: {
    deploymentCircuitBreaker: {
      enable: false,
      rollback: false,
    },
    maximumPercent: 100,
    minimumHealthyPercent: 0,
  },
  desiredCount: 1,
  enableECSManagedTags: false,
  enableExecuteCommand: false,
  loadBalancers: [],
  networkConfiguration: {
    awsvpcConfiguration: {
      assignPublicIp: 'DISABLED',
      securityGroups: [],
      subnets: [
        'subnet-037f3f23c4ac2d42b',
      ],
    },
  },
  placementConstraints: [],
  placementStrategy: [],
  schedulingStrategy: 'REPLICA',
  serviceRegistries: [],
  tags: [],
}
