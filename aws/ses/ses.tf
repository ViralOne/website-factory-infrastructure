module "ses" {
  source  = "cloudposse/ses/aws"
  version = "0.22.3"

  domain      = local.ses.domain
  enabled     = local.ses.enabled
  environment = local.ses.environment
  namespace   = local.ses.namespace

  zone_id       = local.ses.zone_id
  verify_dkim   = local.ses.verify_dkim
  verify_domain = local.ses.verify_domain
}
