
# data "openstack_compute_instance_v2" "my_instance" {
#   name = "instance_test"
#   instance_id = "${module.compute_instance_id0}"

# }


resource "openstack_blockstorage_volume_v3" "volume_1" {
  region      = "RegionOne"
  name        = "volume_1"
  description = "test_create_volume ( blockstorage v3)"
  size        = 3
  

}



# resource "openstack_blockstorage_volume_attach_v3" "va_1" {
#   volume_id  = "${openstack_blockstorage_volume_v3.volume_1.id}"
#   # instance_id = "${openstack_compute_instance_v2.instance_test.id}"
#   host_name = "instance_test"
#   # host_name = 
#   initiator = "${var.initiator}"
#   # instance_id = "${var.instance_id}"
#   device     = "auto"
  
#   depends_on = [module.compute.openstack_compute_instance_v2.instance_test.id] 

#   lifecycle {
#     create_before_destroy = true
#   }

# }
