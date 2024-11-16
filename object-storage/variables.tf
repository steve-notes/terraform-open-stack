variable "region" {
  description = "Name of region"
  type        = string
  default     = "RegionOne"
}

variable "storage_name" {
  description = "Name of Object storage"
  type        = string
  default     = "tf-test-container-1"
}

variable "container_read" {
  description = "Type of container read"
  type        = string
  default     = ".r:*,.rlistings"
}

variable "metadata" {
  description = "Type of container read"
  type        = bool
  default     = "true"
}

variable "content_type" {
  description = "content_type"
  type        = string
  default     = "application/json"
}

variable "location_version" {
  description = "location version"
  type        = string
  default     = "tf-test-container-versions"
}
