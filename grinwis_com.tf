# first create our zone if it doesn't exists
resource "akamai_dns_zone" "grinwis_com" {
  contract       = data.akamai_contract.default.id
  group          = data.akamai_group.default.id
  zone           = "grinwis.com"
  masters        = [""]
  type           = "PRIMARY"
  comment        = "zone created via terraform"
  sign_and_serve = false
}

resource "akamai_dns_record" "www_grinwis_com" {
  zone       = "grinwis.com"
  name       = "www.grinwis.com"
  recordtype = "CNAME"
  active     = true
  ttl        = 600
  target     = ["www.grinwis.com.edgesuite.net"]
  depends_on = [akamai_dns_zone.grinwis_com]
}
