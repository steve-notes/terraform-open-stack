
module "network" {
  source = "./network"
  
}
# ## --------- Compute Module -----------

# module "firewall" {
#  source = "./firewall" 
# }

module "compute" {
  source = "./compute"
  # instance_id = "${module.compute.instance_id}"
  # image_name = "${var.image_name}"
  # image_id = "${var.image_id}"
  # availability_zone = "${var.availability_zone}"
  # flavor_name = "${var.flavor}" 
  # network_id = "${module.network.network_id}"
}

# module "block-storage" {
#   source = "./block-storage" 
#   volume_id = "${module.block-storage.volume_id}"
#   # host_name = "${module.compute.name}"
#   # instance_id = "${module.block_storage.instance_id}"
  
# }

# module "object-storage" {
#  source = "./object-storage"
# }


