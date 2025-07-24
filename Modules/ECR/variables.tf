variable "ECR_Name" {
  description = "value for ECR repository name"
  type        = string
}

variable "tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}