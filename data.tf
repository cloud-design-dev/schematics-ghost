data "ibm_cis_domain" "cis_instance_domain" {
  domain = "thats-la.me"
  cis_id = "${data.ibm_cis.cis_instance.id}"
}

data "ibm_cis" "cis_instance" {
  name = "cis-rt"
}
