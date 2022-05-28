locals {

  azure_configs = {
    description   = "Azure necessary configurations"
    resource_name = "rs-website-factory"
    region        = "West Europe"

  }

  service_plan = {
    description = "Service plan details"
    name        = "websitefactory-svc-plan"
    tier        = "Standard"
    size        = "B1" # Smallest tier but not free, F1 tier didn't allow to apply  
    kind        = "Linux"
    reserved    = true
  }

  service_config = {
    description         = "Service configuration"
    name                = "website-factory"
  }
}
