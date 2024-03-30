output "web_linux_vm_ip_address" {
  description = "Virtual Machine name IP Address"
  value       = azurerm_public_ip.example[*].ip_address
}
