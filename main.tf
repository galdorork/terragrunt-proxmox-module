# Change $PROXMOXSERVERIP to one of your Proxmox Node's IPs or FQDN.
# Change $SUPERSECRETPASSWORD to the root password of the node.
terraform {
  required_providers {
    proxmox = {
      source  = "terraform.example.com/telmate/proxmox"
      version = "1.0.0"
    }
  }
}

provider "proxmox" {
    pm_api_url = "https://${var.node_ip}:8006/api2/json"
    pm_user = "root@pam"
    pm_password = var.node_password
    pm_tls_insecure = "true"
}

# Change $NODETOBEDEPLOYED to the nmode where you want the VMs to be created at.
# Change $LVMSTORAGENAME to the storage that the VM's disk is going to be created at.
resource "proxmox_vm_qemu" "proxmox_vm" {
  count             = length(var.vm_name)
  name              = var.vm_name[count.index]
  target_node       = var.node
  clone             = var.template
  os_type           = var.os_type
  cores             = var.cores
  sockets           = var.sockets
  cpu               = var.cpuhw
  memory            = var.memory
  scsihw            = var.diskhw
  bootdisk          = var.bootdisk
  disk {
    #id              = 0
    size            = var.disk_size
    type            = var.disk_type
    storage         = var.lvm_storage
    storage_type    = var.storage_type
    #iothread        = var.iothread
  }
  network {
    #id              = var.network_id
    model           = var.network_model
    bridge          = var.network_bridge
  }
  lifecycle {
    ignore_changes  = [
      network,
    ]
  }
# Cloud Init Settings (Change the IP range and the GW to suit your needs)
  ipconfig0 = "ip=${var.ip[count.index]}/${var.network_mask},gw=${var.gateway}"
  sshkeys = <<EOF
  ${var.ssh_key}
  EOF
}
