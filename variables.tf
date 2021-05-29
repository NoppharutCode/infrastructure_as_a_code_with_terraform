
variable "ami" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ami-0d5eff06f840b45e9"
}

variable "tags" {
  description = "Value of the Name tag for the EC2 instance"
  type        = map(string)
}

variable "security_name" {
    type       = string
}