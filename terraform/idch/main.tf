terraform {
  required_providers {
    idcloudhost = {
      source = "bapung/idcloudhost"
      version = "0.1.0"
    }
  }
}

provider "idcloudhost" {
    auth_token = "xxxxxx" # API Token from idcloudhost.com
}

resource "idcloudhost_vm" "appserver" {
    name = "appserver"
    os_name = "ubuntu"
    os_version= "20.04"
    disks = 20
    vcpu = 2
    memory = 2048
    username = "kiminonawa"
    initial_password = "Password1" # Combination of Uppercase, Lowercase & Numbers
    billing_account_id = 12345# Billing ID from idcloudhost.com
    backup = false
    public_key = "id_rsa.pub" # SSH public key
}

resource "idcloudhost_vm" "gateway" {
    name = "kiminonawa"
    os_name = "ubuntu"
    os_version= "20.04"
    disks = 20
    vcpu = 1
    memory = 1024
    username = "aziz"
    initial_password = "Password1" # Combination of Uppercase, Lowercase & Numbers
    billing_account_id = 1234# Billing ID from idcloudhost.com
    backup = false
    public_key = "id_rsa.pub" # SSH public key
}

