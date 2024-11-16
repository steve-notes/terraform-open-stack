output "volume_id" {
 value = "${openstack_blockstorage_volume_v3.volume_1.id}"
}

# output "instance_id" {
#   value = "${module.compute.instance_id}"
# }