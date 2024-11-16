
# ..######...#######..##.....##.########..##.....##.########.########....##.....##..#######..########..##.....##.##.......########
# .##....##.##.....##.###...###.##.....##.##.....##....##....##..........###...###.##.....##.##.....##.##.....##.##.......##......
# .##.......##.....##.####.####.##.....##.##.....##....##....##..........####.####.##.....##.##.....##.##.....##.##.......##......
# .##.......##.....##.##.###.##.########..##.....##....##....######......##.###.##.##.....##.##.....##.##.....##.##.......######..
# .##.......##.....##.##.....##.##........##.....##....##....##..........##.....##.##.....##.##.....##.##.....##.##.......##......
# .##....##.##.....##.##.....##.##........##.....##....##....##..........##.....##.##.....##.##.....##.##.....##.##.......##......
# ..######...#######..##.....##.##.........#######.....##....########....##.....##..#######..########...#######..########.########

# set amount of RAM and CPU
resource "openstack_compute_flavor_v2" "custom_flavor" {
  name          = "custom_flavor"
  ram           = 16384
  vcpus         = 4
  disk          = 40
  is_public = true
}

# create an instance
resource "openstack_compute_instance_v2" "eks-anywhere" {
  # count = "1"
  name = "eks-anywhere"
  # id = "${openstack_compute_instance_v2.instance_test.id}"
  image_name = "${var.image_name}"
  image_id = "${var.image_id}"
  availability_zone = "${var.availability_zone}"
  # flavor_name = "${var.flavor}"
  flavor_name = "${openstack_compute_flavor_v2.custom_flavor.name}"
  key_pair = "${var.ssh_key_pair}"
  security_groups = ["${var.security_group}"] 
  flavor_id = openstack_compute_flavor_v2.custom_flavor.id
  # ram = "16384"
  network {
    name = "${var.network}"
    # uuid = "${var.network_id}"
}
 lifecycle {
    create_before_destroy = true
  }

}




# resource "openstack_compute_secgroup_v2" "secgroup_1" {
#   name        = "secgroup_1"
#   description = "a security group"

#   rule {
#     from_port   = 22
#     to_port     = 22
#     ip_protocol = "tcp"
#     cidr        = "0.0.0.0/0"
#   }
# }
# ------------------ managed volume attached to instance ----------------------

# resource "openstack_blockstorage_volume_v3" "volume_1" {
#   region      = "RegionOne"
#   name        = "volume_1"
#   description = "test_attached_volume"
#   size        = 3
#


# resource "openstack_compute_volume_attach_v2" "va_1" {
#   instance_id = "${openstack_compute_instance_v2.instance_test.id}"
#   volume_id   = "${openstack_blockstorage_volume_v3.volume_1.id}"
# }

# ------------------ end volume attached to instance ----------------------
