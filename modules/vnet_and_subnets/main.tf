# setup azure terraform provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.107.0"
    }
  }
}


# azurerm_virtual_network to create the azure vnet in the azure resource group
# official documentation https://registry.terraform.io/providers/hashicorp/azurerm/3.65.0/docs/resources/virtual_network
resource "azurerm_virtual_network" "minh_az_vnet" {
  name                = var.vnet_name
  location            = "northeurope"
  resource_group_name = "myTFResourceGroup"
  address_space       = var.address_space
  tags                = merge(var.tags, var.additional_vnet_tags)
}

# azurerm_subnet to create the azure subnet in the azure vnet
# official documentation https://registry.terraform.io/providers/hashicorp/azurerm/3.65.0/docs/resources/subnet
resource "azurerm_subnet" "minh_az_subnet" {
  name                 = var.subnet_name
  resource_group_name  = "myTFResourceGroup"
  virtual_network_name = azurerm_virtual_network.minh_az_vnet.name
  address_prefixes     = var.subnet_address_prefix
  service_endpoints    = var.service_endpoints
}