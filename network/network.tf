
# ------------------------------------------------------------------------#
# openstack_networking_network_v2

resource "openstack_networking_network_v2" "test-network" {
  name           = "test-network"
  admin_state_up = "true"
  external = "true"
  shared = "true"

  segments {
    physical_network = var.physical_network 
    network_type = var.network_type
  }
}

resource "openstack_networking_subnet_v2" "subnet_1" {
  name       = "subnet_1"
  network_id = "${openstack_networking_network_v2.test-network.id}"
  cidr       = var.subnet_cidr 
  ip_version = var.ip_version
  gateway_ip = var.gateway_ip

  allocation_pool {
    start = var.allocation_pool_start 
    end   = var.allocation_pool_end 
  }

}

resource "openstack_compute_secgroup_v2" "secgroup_1" {
  name        = "secgroup_1"
  description = "a security group"

  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
}

resource "openstack_networking_port_v2" "port_1" {
  name               = "port_1"
  network_id         = "${openstack_networking_network_v2.test-network.id}"
  admin_state_up     = "true"
  security_group_ids = ["${openstack_compute_secgroup_v2.secgroup_1.id}"]

  fixed_ip {
    subnet_id  = "${openstack_networking_subnet_v2.subnet_1.id}"
    ip_address = "172.20.0.10"
  }
}


# resource "openstack_compute_instance_v2" "instance_1" {
#   name            = "instance_1"
#   security_groups = ["${openstack_compute_secgroup_v2.secgroup_1.name}"]

#   network {
#     port = "${openstack_networking_port_v2.port_1.id}"
#   }
# }

#---------------------------------------------------------------------#


# end openstack_networking_network_v2

# resource "openstack_networking_network_v2" "my-network" {
#   name        = "my-network"
#   admin_state_up = "true"
#   segments {
#     physical_network = "physnet0"
#     network_type = "vlan"
#   }
# }

# resource "openstack_networking_subnet_v2" "my-subnet" {
#   name       = "my-subnet"
#   cidr       = "172.10.0.0/24"
#   network_id = "${openstack_networking_network_v2.my-network.id}"
# }


#--------------------- openstack_networking_trunk_v2 ----------------------------------#

# resource "openstack_networking_network_v2" "test-network" {
#   name           = "test-network"
#   admin_state_up = "true"
# }

# resource "openstack_networking_subnet_v2" "subnet_1" {
#   name        = "subnet_1"
#   network_id  = "${openstack_networking_network_v2.test-network.id}"
#   cidr        = "172.20.0.0/24"
#   ip_version  = 4
#   enable_dhcp = true
#   no_gateway  = true
# }

# resource "openstack_networking_port_v2" "parent_port_1" {
#   depends_on = [
#     "openstack_networking_subnet_v2.subnet_1",
#   ]

#   name           = "parent_port_1"
#   network_id     = "${openstack_networking_network_v2.test-network.id}"
#   admin_state_up = "true"
# }

# resource "openstack_networking_port_v2" "subport_1" {
#   depends_on = [
#     "openstack_networking_subnet_v2.subnet_1",
#   ]

#   name           = "subport_1"
#   network_id     = "${openstack_networking_network_v2.test-network.id}"
#   admin_state_up = "true"
# }

# resource "openstack_networking_trunk_v2" "trunk_1" {
#   name           = "trunk_1"
#   admin_state_up = "true"
#   port_id        = "${openstack_networking_port_v2.parent_port_1.id}"

#   sub_port {
#     port_id           = "${openstack_networking_port_v2.subport_1.id}"
#     segmentation_id   = 1
#     segmentation_type = "vlan"
#   }
# }

# resource "openstack_compute_instance_v2" "instance_1" {
#   name            = "instance_1"
#   security_groups = ["default"]

#   network {
#     port = "${openstack_networking_trunk_v2.trunk_1.port_id}"
#   }
# }