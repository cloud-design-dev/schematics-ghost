# ghost-ibm-schematics

## Variables without defaults
 - Hostname
 - Domain name 
 - SSH Key name (should already exist in the IaaS account)

## Variables with defaults that can be changed
 - Flavor size:
    - B1_2X4X100: SAN-backed 2x4 with 100GB primary drive **default**
    - Flavors starting with `bsan-*` are SAN backed and `blocal-*` instances are local disk backed instances. 
    - If using a `blocal-*` instance flavor you also need to set the `local_disk` variable to `true`. 
 - Operating System. Currently only tested on Ubuntu 16/18 (u16 or u18 in os_reference_code variable map)
 - Datacenter. This defaults to wdc06 (us-east2 in the datacenter variable map)