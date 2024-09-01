# modules/nlb/variables.tf

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}
