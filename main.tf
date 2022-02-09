resource "aws_ecs_cluster" "this" {
  count = var.create_ecs ? 1 : 0

  name = var.name

  capacity_providers = var.capacity_providers

  dynamic "default_capacity_provider_strategy" {
    for_each = var.default_capacity_provider_strategy
    iterator = strategy

    content {
      capacity_provider = strategy.value["capacity_provider"]
      weight            = lookup(strategy.value, "weight", null)
      base              = lookup(strategy.value, "base", null)
    }
  }

  setting {
    name  = "containerInsights"
    value = var.container_insights ? "enabled" : "disabled"
  }

  tags = var.tags
}

################################################################################
# capacity provider ASG
################################################################################

resource "aws_ecs_capacity_provider" "provider-asg" {
  name = "provider-asg"

  auto_scaling_group_provider {
    auto_scaling_group_arn = var.autoscaling_group_arn
  }

}

