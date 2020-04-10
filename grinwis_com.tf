# first create our zone if it doesn't exists
resource "akamai_dns_zone" "grinwis_com" {
  contract       = data.akamai_contract.default.id
  group          = data.akamai_group.default.id
  zone           = "grinwis.com"
  type           = "secondary"
  masters        = ["1.2.3.4", "1.2.3.5"]
  comment        = "zone created via terraform"
  sign_and_serve = false
}

# special AKAMAICDN DNS record to point to delivery configuration for zone apex mapping
resource "akamai_dns_record" "cdn_grinwis_com" {
  zone       = "grinwis.com"
  name       = "grinwis.com"
  recordtype = "AKAMAICDN"
  active     = true
  ttl        = 20
  target     = ["apollo.akamaized.net"]
  depends_on = [akamai_dns_zone.grinwis_com]
}
