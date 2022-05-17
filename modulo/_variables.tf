variable "origen_region" {
  type        = "string"
}

variable "destination_region" {
  type        = "string"
}

variable "origen_bucket_name" {
  type        = "string"
}

variable "replicate_prefix" {
  type        = "string"
  default     = ""
}

variable "destination_bucket_name" {
  type        = "string"
}

variable "create_destination_bucket" {
  type        = "string"
  default     = "true"
}

variable "replication_name" {
  type        = "string"
}

variable "account_id"{
type          = "string"
}

variable "create_origen_bucket"{
  type        = "string"
  default     = "true"
}