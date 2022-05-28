locals {

  azure_configs = {
    description   = "Azure necessary configurations"
    resource_name = "rs-website-factory"
    region        = "West Europe"
  }

  storage_config = {
    account_name     = "wfaccount"
    tier             = "Standard" # Smalles type
    replication_type = "LRS" #Locally Redundant Storage
  }
}
