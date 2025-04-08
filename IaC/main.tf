terraform {
    # Import the latest version of the promox providor as 'proxmox'
    # https://registry.terraform.io/providers/Telmate/proxmox/latest/docs
    required_providers {
        proxmox = {
            source = "Telmate/proxmox"
            version = "3.0.1-rc8"
        }
    }
}

provider "proxmox" {
    # Configure the connection to the PVE Host
    pm_api_url              = var.PM_API_URL
    pm_api_token_id         = var.PM_API_TOKEN_ID   
    pm_api_token_secret     = var.PM_API_TOKEN_SECRET
    # Allow Insecure connections (Use until I start getting local Certs sorted)
    pm_tls_insecure         = true

}


resource "proxmox_vm_qemu" "test-vm" {
  name        = "VM-name"
  target_node = "RM21"

  disks {
    ide {
      ide2 {
        cdrom {
          iso = "ISO file"
        }
      }
    }
  }

  ### or for a Clone VM operation
  # clone = "template to clone"

  ### or for a PXE boot VM operation
  # pxe = true
  # boot = "scsi0;net0"
  # agent = 0
}