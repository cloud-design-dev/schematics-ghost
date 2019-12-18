data "ibm_compute_ssh_key" "deploymentKey" {
  label = "${var.ssh_key_name}"
}

resource "ibm_compute_vm_instance" "ghost" {
  hostname             = "${var.hostname}"
  domain               = "${var.domain}"
  os_reference_code    = "${var.os_reference_code}"
  datacenter           = "${var.datacenter}"
  network_speed        = 1000
  hourly_billing       = true
  private_network_only = false
  local_disk           = "${var.local_disk}"
  user_metadata        = "${file("install.sh")}"
  flavor_key_name      = "${var.flavor_key_name}"
  tags                 = ["ghost", "${var.datacenter}"]
  ssh_key_ids          = ["${data.ibm_compute_ssh_key.deploymentKey.id}"]
}

resource "ibm_cis_dns_record" "example" {
  cis_id    = "${data.ibm_cis.cis_instance.id}"
  domain_id = "${data.ibm_cis_domain.cis_instance_domain.id}"
  name      = "${var.hostname}"
  content   = "${ibm_compute_vm_instance.node.ipv4_address}"
  type      = "A"
}

output "Ghost URL" {
  value = "Please visit http://${var.hostname}.${var.domain}/ghost to complete your set up."
}
