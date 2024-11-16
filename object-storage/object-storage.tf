resource "openstack_objectstorage_container_v1" "container_1" {
  region = var.region
  name   = var.storage_name
  container_read = var.container_read

  metadata = {
    test = var.metadata
  }

  content_type = var.content_type

  versioning {
    type     = "versions"
    location = var.location_version
  }
}
