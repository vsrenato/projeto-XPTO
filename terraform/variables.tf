variable "region" {
  description = "Região AWS a ser utilizada"
  type        = string
  default     = "us-east-1"
}

variable "eks_instance_type" {
  description = "Tipo de instância para os nós do EKS"
  type        = string
  default     = "t3.medium"
}

variable "eks_desired_capacity" {
  description = "Capacidade desejada de nós no cluster"
  type        = number
  default     = 3
}

variable "eks_max_size" {
  description = "Número máximo de nós no cluster"
  type        = number
  default     = 5
}

variable "lambda_memory_size" {
  description = "Tamanho de memória das funções Lambda"
  type        = number
  default     = 1024
}

variable "lambda_reserved_concurrent_executions" {
  description = "Número reservado de execuções simultâneas da Lambda"
  type        = number
  default     = 100
}