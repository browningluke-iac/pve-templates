resource "proxmox_virtual_environment_vm" "ubuntu_2404" {
  name  = "ubuntu-24.04"
  vm_id = 9001

  node_name = var.pve_node

  template = true
  scsi_hardware = "virtio-scsi-single"

  on_boot = false

  cpu {
    cores   = 1
    sockets = 1
    type    = "host"
  }

  memory {
    dedicated = 128
    floating  = 0
  }

  disk {
    datastore_id = "extpool"
    file_id      = proxmox_virtual_environment_download_file.ubuntu_2404_cloud_image.id
    interface    = "scsi0"
    iothread     = true
    size         = 4
    discard      = "on"
  }

  serial_device {
    device = "socket"
  }

  vga {
    type = "serial0"
  }
}

resource "proxmox_virtual_environment_download_file" "ubuntu_2404_cloud_image" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = var.pve_node
  url          = "https://cloud-images.ubuntu.com/minimal/releases/noble/release/ubuntu-24.04-minimal-cloudimg-amd64.img"
  file_name    = "ubuntu-24.04-minimal-cloudimg-amd64.img"
}
