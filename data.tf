data "ibm_cis_domain" "cis_instance_domain" {
  domain = "thats-la.me"
  cis_id = "${data.ibm_cis.cis_instance.id}"
}

data "ibm_cis" "cis_instance" {
  name = "cis-rt"
  resource_group_id = "${data.ibm_resource_group.resource_group.id}"
}


data "ibm_resource_group" "resource_group" {
  name = "${var.resource_group}"
}
