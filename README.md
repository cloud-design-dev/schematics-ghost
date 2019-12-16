# ghost-ibm-schematics

## Variables without defaults
 - Hostname
 - Domain name 
 - SSH Key name (should already exist in the IaaS account)

## Variables with defaults that can be changed
 - Flavor size. Full list of flavors [here](https://cloud.ibm.com/docs/vsi?topic=virtual-servers-about-virtual-server-profiles). **Default**: SAN-backed 2x4 with 100GB primary drive (B1_2X4X100). 
 - Operating System. Currently only tested on Ubuntu 16/18. **Default**: UBUNTU_18_64
 - Datacenter. The datacenter in which you want to provision the instance. **Default** wdc06
 - Local Disk. Set to true if using a local-backed instance. **Default**: false