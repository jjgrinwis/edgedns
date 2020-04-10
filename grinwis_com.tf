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

resource "akamai_dns_record" "www_grinwis_com" {
  zone       = "grinwis.com"
  name       = "www.grinwis.com"
  recordtype = "AKAMAICDN"
  active     = true
  ttl        = 600
  target     = ["www.grinwis.com"]
  depends_on = [akamai_dns_zone.grinwis_com]
}
