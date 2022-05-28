locals {

  azure_configs   = {
    description   = "Azure necessary configurations"
    resource_name = "rs-website-factory"
    region        = "West Europe"

  }

  service_plan = {
    description = "Service plan details"
    name        = "websitefactory-svc-plan"
    tier        = "Standard"
    size        = "S1"
  }
}
