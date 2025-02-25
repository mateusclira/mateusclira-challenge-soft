resource "azurerm_kubernetes_cluster" "main" {
  name                = "k8s-${var.cname}-${var.env_id}"
  location            = var.region
  resource_group_name = "rg-${var.env_id}-${var.cname}"
  dns_prefix          = "k8s-${var.cname}"

  default_node_pool {
    name       = "default"
    node_count = "2"
    vm_size    = "Standard_B2s"
  }
  identity {
    type = "SystemAssigned"
  }
}
