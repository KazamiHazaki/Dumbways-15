terraform {
  required_providers {
    idcloudhost = {
      source = "bapung/idcloudhost"
      version = "0.1.3"
    }
  }
}

provider "idcloudhost" {
    auth_token = "YOUR_API_TOKEN" # API Token from idcloudhost.com
    region="sgp01" # REGION SINGAPORE
}

resource "idcloudhost_vm" "appserver" {
    name = "my-appserver"
    os_name = "ubuntu"
    os_version= "20.04"
    disks = 20
    vcpu = 2
    memory = 2048
    username = "kiminonawa"
    initial_password = "Password1" # Combination of Uppercase, Lowercase & Numbers
    billing_account_id = 1234565# Billing ID from idcloudhost.com
    backup = false
    public_key = "your pub_key" # SSH public key
}

resource "idcloudhost_vm" "gateway" {
    name = "my-gateway"
    os_name = "ubuntu"
    os_version= "20.04"
    disks = 20
    vcpu = 1
    memory = 1024
    username = "kazami"
    initial_password = "Password1" # Combination of Uppercase, Lowercase & Numbers
    billing_account_id = 123456# Billing ID from idcloudhost.com
    backup = false
    public_key = "your pub_key" # SSH public key
}

resource "idcloudhost_vm" "cicd" {
    name = "my-cicd"
    os_name = "ubuntu"
    os_version= "20.04"
    disks = 20
    vcpu = 2
    memory = 2048
    username = "kazami"
    initial_password = "Password1" # Combination of Uppercase, Lowercase & Numbers
    billing_account_id = 123456# Billing ID from idcloudhost.com
    backup = false
    public_key = "your pub_key" # SSH public key
}

resource "idcloudhost_vm" "monitoring" {
    name = "my-monitoring"
    os_name = "ubuntu"
    os_version= "20.04"
    disks = 20
    vcpu = 2
    memory = 2048
    username = "kazami"
    initial_password = "Password1" # Combination of Uppercase, Lowercase & Numbers
    billing_account_id = 123456# Billing ID from idcloudhost.com
    backup = false
    public_key = "your pub_key" # SSH public key
}

resource "idcloudhost_floating_ip" "network-appserver" { 
    name = "my-net-app" 
    billing_account_id = 123456 
    assigned_to = idcloudhost_vm.appserver.id 
    } 


resource "idcloudhost_floating_ip" "network-gateway" { 
    name = "my-net-gate" 
    billing_account_id = 123456 
    assigned_to = idcloudhost_vm.gateway.id 
    }
    

resource "idcloudhost_floating_ip" "network-cicd" { 
    name = "my-net-cicd" 
    billing_account_id = 123456 
    assigned_to = idcloudhost_vm.cicd.id 
    }
    

resource "idcloudhost_floating_ip" "network-monitoring" { 
    name = "my-net-monitoring" 
    billing_account_id = 123456 
    assigned_to = idcloudhost_vm.monitoring.id 
    }
    

output "IP_Publik_appserver" {
   value = idcloudhost_floating_ip.network-appserver.address
}
output "IP_Publik_gateway" {
   value = idcloudhost_floating_ip.network-gateway.address
}
output "IP_Publik_cicd" {
   value = idcloudhost_floating_ip.network-cicd.address
}
output "IP_Publik_monitoring" {
   value = idcloudhost_floating_ip.network-monitoring.address
}
