## Create Route 53 zone

resource "aws_route53_zone" "zone" {
  name     = local.ses.domain
  tags     = {}
}

## Create SES record

resource "aws_ses_domain_identity" "primary" {
  domain = aws_route53_zone.zone.name
}

resource "aws_route53_record" "ses_verif" {
  zone_id = aws_route53_zone.zone.zone_id
  name    = "_amazonses.${aws_ses_domain_identity.primary.id}"
  type    = "TXT"
  ttl     = "600"
  records = [aws_ses_domain_identity.primary.verification_token]
}

resource "aws_ses_domain_identity_verification" "ses_verif" {
  domain = aws_ses_domain_identity.primary.id

  depends_on = [aws_route53_record.ses_verif]
}

resource "aws_route53_record" "email" {
  zone_id = aws_route53_zone.zone.zone_id
  name    = aws_route53_zone.zone.name
  type    = "MX"
  ttl     = "600"
  records = ["10 inbound-smtp.${local.aws_region.default}.amazonaws.com"]
}

## Create a DNS record for the domain
 
resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.zone.zone_id
  name    = local.domain.record_A
  type    = "A"
  ttl     = "300"
  records = [module.ec2_instance.public_ip]
}

resource "aws_route53_record" "www_v6" {
  zone_id = aws_route53_zone.zone.zone_id
  name    = local.domain.record_A
  type    = "AAAA"
  ttl     = "300"
  records = [module.ec2_instance.public_ip]
}
