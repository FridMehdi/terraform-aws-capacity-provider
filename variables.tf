variable "name_provider" {
  description = "The name of the provider"
  type        = string
  default     = null
}
variable "autoscaling_group_arn" {
  description = "The name arn id of the ressource group to attach to ECS"
  type        = string
  default     = null
}
variable "managed_termination_protection" {
  description = "Variable to set to ENABLED if managed provider capacity needed"
  type        = string
  default     = null
}
variable "maximum_scaling_step_size" {
  description = "Maximum step adjustment size. A number between 1 and 10,000"
  type        = number
  default     = null
}

variable "minimum_scaling_step_size" {
  description = "Maximum step adjustment size. A number between 1 and 10,000"
  type        = number
  default     = null
}

variable "status" {
  description = "Whether auto scaling is managed by ECS. Valid values are ENABLED and DISABLED"
  type        = string
  default     = null
}
variable "target_capacity" {
  description = "Target utilization for the capacity provider. A number between 1 and 100."
  type        = number
  default     = null
}