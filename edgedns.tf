provider "akamai" {
  edgerc      = "~/.edgerc"
  dns_section = "dns"
}

data "akamai_contract" "default" {
  #group = "GSS Training Internal"
}

# select specific group, needed as argument when creating a zone
data "akamai_group" "default" {
  #name = "GSS Training Internal-C-1IE2OHM"
}
