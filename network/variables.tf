variable "physical_network" {
 default = "physnet1"
}

variable "network_type" {
 default = "flat"
}

variable "network_name" {
 default = "my-network"
}

variable "subnet_name" {
 default = "my-subnet"
}

variable "subnet_cidr" {
 default = "172.20.0.0/24"
}

variable "ip_version" {
 default = "4"
}

variable "gateway_ip" {
 default = "172.20.0.254"
}

variable "allocation_pool_start" {
  default = "172.20.0.100"
}

variable "allocation_pool_end"  {
 default = "172.20.0.220" 
}