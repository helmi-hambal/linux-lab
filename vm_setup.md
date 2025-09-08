# Azure VM Setup Notes

## Create VM (Azure Portal)
- Resource Group: `linux-lab-rg`
- VM Name: `linux-vm01`
- Image: `Ubuntu 22.04 LTS`
- Size: `Standard_B1s`
- Auth: SSH key
- Networking: 
  - VNet: `linux-lab-vnet`
  - NSG: allow SSH (22)

## Post-Deploy Setup
- Connect via SSH:
  ```bash
  ssh azureuser@<public-ip>

## Post-Deploy Setup
- Update Ubuntu packages (`sudo apt update && sudo apt upgrade -y`)
- Enabled monthly budget alert in Azure Cost Management
- Enabled auto-shutdown at 12:00 AM (to save cost)

