resource "akamai_dns_zone" "test_zone" {
  contract       = data.akamai_contract.default.id
  group          = data.akamai_group.default.id
  zone           = "grinwis.net"
  masters        = [""]
  type           = "PRIMARY"
  comment        = "test zone created via terraform"
  sign_and_serve = false
}

resource "akamai_dns_record" "www_grinwis_net" {
  zone       = "grinwis.net"
  name       = "www.grinwis.net"
  recordtype = "CNAME"
  active     = true
  ttl        = 600
  target     = ["www.grinwis.com.edgesuite.net"]
  depends_on = [akamai_dns_zone.test_zone]
}
