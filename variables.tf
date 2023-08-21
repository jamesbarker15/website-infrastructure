variable "sg-ports" {
  type        = list(number)
  description = "list of ports for SG"
  default     = [80, 443, 22]
}

variable "lb-ports" {
  type        = list(number)
  description = "Load Balancer SG Ports"
  default     = [80, 443]
}