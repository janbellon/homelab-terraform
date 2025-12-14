resource "powerdns_record" "vm_domain_a" {
    for_each = local.vm_map
    zone    = "${each.value.zone}."
    name    = "${each.value.hostname}.${each.value.zone}."
    type    = "A"
    ttl     = 300
    records = ["${each.value.ip}"]
}

resource "powerdns_zone" "nbl" {
  name        = "nbl.lan."
  kind        = "Native"
  nameservers = ["10.2.50.12."]
}

resource "powerdns_zone" "kube" {
  name        = "kube.nbl.lan."
  kind        = "Native"
  nameservers = ["10.2.50.12."]
}

resource "powerdns_zone" "srv" {
  name        = "srv.nbl.lan."
  kind        = "Native"
  nameservers = ["10.2.50.12."]
}

resource "powerdns_zone" "lab" {
  name        = "lab.nbl.lan."
  kind        = "Native"
  nameservers = ["10.2.50.12."]
}