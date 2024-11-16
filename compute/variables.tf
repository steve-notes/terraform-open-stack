# variable "openstack_user_name" {}
# variable "openstack_tenant_name" {}
# variable "openstack_password" {}
# variable "openstack_auth_url" {}

# variable "openstack-credential" {
#   type = string
#   default = ".config/openstack/credentials"
# }

# variable "credential-file" {
#   default = ".config/openstack/clouds.yaml"
# }


variable "image_name" {
  default = "CentOS-Stream.qcow2"
}

variable "image_id" {
  # default = "1e10c2cb-93a8-4413-8d59-ae19772817dd"
  default = "9ae2467d-3423-40b1-934c-1f14cf6ea0c1" 
}

variable "flavor" {
  default = "m1.medium"
}

variable "ssh_key_pair" {
  default = "steven"
}

variable "ssh_user_name" {
  default = "root"
}

variable "availability_zone" {
	default = "nova"
}

variable "security_group" {
	default = "default"
}

variable "network" {
	default  = "test-network"
}


# variable "network_id" {
# 	# default  = ""
# }



# variable "instance_id" {
# }