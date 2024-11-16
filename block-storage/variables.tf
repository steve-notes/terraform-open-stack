# variable "vid" {
#  default =  "${openstack_blockstorage_volume_v3.volume_1.id}"
# }

# variable "iid" {
#  default =  "${openstack_compute_instance_v2.testing.id}"
# }

variable "volume_id" {
  
}

# variable "host_name" {
  
# }
  
variable "initiator" {
default = "iqn.1994-05.com.redhat:dda0ae3518c"
    }