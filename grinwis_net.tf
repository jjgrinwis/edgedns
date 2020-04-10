
resource "akamai_dns_zone" "grinwis_net" {
  contract       = data.akamai_contract.default.id
  group          = data.akamai_group.default.id
  zone           = "grinwis.net"
  type           = "primary"
  masters        = []
  comment        = "zone created via terraform"
  sign_and_serve = false
}

# special AKAMAICDN DNS record to point to delivery configuration for zone apex mapping
resource "akamai_dns_record" "www_grinwis_com" {
  zone       = "grinwis.com"
  name       = "www.grinwis.com"
  recordtype = "CNAME"
  active     = true
  ttl        = 20
  target     = ["www.grinwis.com.akamaized.net"]
  depends_on = [akamai_dns_zone.grinwis_net]
}
