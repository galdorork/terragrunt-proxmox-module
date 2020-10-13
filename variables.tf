  variable "vm_count" {
      description = "(Required) Amount of VMs to be created"
      default = "0"
      type = "string"
  }
  variable "vm_name[count.index]" {
      description = "(Required) VM Name"
      default = "tf"
      type = "string"
  }
  variable "node" {
      description = "(Required) Proxmox Node to deploy to"
      default = ""
      type = "string"
  }
  variable "node_ip" {
      description = "(Required) Proxmox Node IP to be used"
      default = ""
      type = "string"
  }
  variable "node_password" {
      description = "(Required) Proxmox Node password to be used"
      default = ""
      type = "string"
  }
  variable "template" {
      description = "(Required) Source template to be used, this example uses debian-cloudinit."
      default = "debian-cloudinit"
      type = "string"
  }
  variable "os_type" {
      description = "(Optional) Type of VM to be created, this example needs cloud-init"
      default = "cloud-init"
      type = "string"
  }
  variable "cores" {
      description = "(Required) Amount of CPU Cores to be used by the VM"
      default = "1"
      type = "string"
  }
  variable "sockets" {
      description = "(Optional) Amount of CPU Sockets to be used by the VM, by default it assumes one socket"
      default = "1"
      type = "string"
  }
  variable "cpuhw" {
      description = "(Optional) CPU Arquitecture to be used by the VM, by default it uses the host CPU architecture definition"
      default = "host"
      type = "string"
  }
  variable "memory" {
      description = "(Required) VM memory amount in MiB"
      default = "1024"
      type = "string"
  }
  variable "diskhw" {
      description = "(Optional) Disk driver to be used, by default it uses virtio-scsi-pci"
      default = "virtio-scsi-pci"
      type = "string"
  }
  variable "bootdisk" {
      description = "(Optional) Disk to boot from, by default it uses the first disk created"
      default = "scsi0"
      type = "string"
  }
  variable "disk_size" {
      description = "Optional) Disk dize for the VM in GiB, by default it's set to 20GiB"
      default = "20"
      type = "string"
  }
  variable "disk_type" {
      description = "(Optional) Disk type definition for Proxmox"
      default = "scsi"
      type = "string"
  }
  variable "lvm_storage" {
      description = "(Required) Storage lvm volume where the disk will be created"
      default = ""
      type = "string"
  }
  variable "storage_type" {
      description = "(Optional) Volume type for the volume where the disk will be created"
      default = "lvm"
      type = "string"
  }
  variable "iothread" {
      description = "(Optional) iothread Enabled by default, improves disk performance on LVM"
      default = "true"
      type = "string"
  }
  variable "network_id" {
      description = "(Optional) Virtual Network card ID to be used, defaults to 0"
      default = "0"
      type = "string"
  }
  variable "network_model" {
      description = "(Optional) Virtual Network card model to be used, defaults to virtio"
      default = "virtio"
      type = "string"
  }
  variable "network_bridge" {
      description = "(Optional) Virtual Network bridge to be used by the VM, uses vmbr0 as default bridge created by Proxmox"
      default = "vmbr0"
      type = "string"
  }
  variable "ip" {
      description = "(Required) IP to be used by the VM"
      default = ""
      type = "string"
  }
  variable "ssh_key" {
      description = "(Required) SSH Key to be configured for access to the VM, you won't be able to access the VMs if this value isn't set up"
      default = ""
      type = "string"
  }