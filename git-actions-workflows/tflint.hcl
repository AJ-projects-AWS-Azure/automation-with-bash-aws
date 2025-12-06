plugin "azurerm" {
  enabled = true
  version = "0.30.0"
  source  = "github.com/terraform-linters/tflint-ruleset-azurerm"
}

config {
  module              = true
  force               = true
  disabled_by_default = false
}

rule "required_tags" {
  enabled = true
  tags = ["environment","owner","costcenter","application","managed_by"]
}

rule "azurerm_resource_group_invalid_location" {
  enabled = true
  locations = ["eastus","eastus2","centralus","westus2"]
}

rule "terraform_naming_convention" {
  enabled = true
  format  = "^[a-z0-9-]{3,50}$"
}

rule "azurerm_storage_account_disallowed_sku" {
  enabled = true
  skus = ["Standard_GRS","Standard_RAGRS","Premium_LRS"]
}

rule "azurerm_virtual_machine_disallowed_size" {
  enabled = true
  vm_sizes = ["Standard_A0","Standard_A1","Standard_A2"]
}

rule "azurerm_storage_account_enable_https" {
  enabled = true
}

rule "azurerm_storage_account_allow_blob_public_access" {
  enabled = true
  allow_blob_public_access = false
}

rule "azurerm_public_ip" {
  enabled       = true
  allow_public  = false
}