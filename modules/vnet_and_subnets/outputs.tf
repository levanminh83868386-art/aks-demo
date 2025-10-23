output "az_vnet_id" {
  description = "The ID of the vnet"
  value       = azurerm_virtual_network.minh_az_vnet.id
}

output "az_subnet_id" {
  description = "The ID of the subnet"
  value       = azurerm_subnet.minh_az_subnet.id
}