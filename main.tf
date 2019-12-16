data "ibm_compute_ssh_key" "deploymentKey" {
  label = "${var.ssh_key_name}"
}

resource "ibm_compute_vm_instance" "ghost" {
  hostname             = "${var.hostname}"
  domain               = "${var.domain}"
  os_reference_code    = "${var.os_reference_code["u18"]}"
  datacenter           = "${var.datacenter["us-east2"]}"
  network_speed        = 1000
  hourly_billing       = true
  private_network_only = false
  local_disk           = "${var.local_disk}"
  user_metadata        = "${file("install.sh")}"
  flavor_key_name      = "${var.flavor_key_name["bsan-small"]}"
  tags                 = ["ghost", "${var.datacenter["us-east2"]}"]
  ssh_key_ids          = ["${data.ibm_compute_ssh_key.deploymentKey.id}"]
}
