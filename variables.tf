variable "iaas_classic_username" {
  description = "Enter the user name to access IBM Cloud classic infrastructure. You can retrieve the user name by following the instructions for retrieving your classic infrastructure API key."
}

variable "iaas_classic_api_key" {
  description = "Enter the API key to access IBM Cloud classic infrastructure. For more information for how to create an API key and retrieve it, see [Managing classic infrastructure API keys](https://cloud.ibm.com/docs/iam?topic=iam-classic_keys)."
}

variable "ibmcloud_api_key" {
  description = "Enter your IBM Cloud API Key, you can get your IBM Cloud API key using: https://cloud.ibm.com/iam#/apikeys"
}

variable datacenter {
  description = "The IBM Cloud datacenter to provision the instance. Options are: ams01,ams03,che01,dal05,dal06,dal09,dal10,dal12,dal13,fra02,fra04,fra05,hkg02,hou02,lon02,lon04,lon05,lon06,mel01,mex01,mil01,mon01,osl01,par01,sao01,sea01,seo01,sjc01,sjc03,sjc04,sng01,syd01,syd04,syd05,tok02,tok04,tok05,tor01,wdc01,wdc04,wdc06,wdc07"
  type        = "string"
  default     = "wdc06"
}

variable os_reference_code {
  description = "The Operating System to provision. Currently only supported for UBUNTU_16_64 and UBUNTU_18_64"
  type        = "string"
  default     = "UBUNTU_18_64"
}

variable flavor_key_name {
  description = "The flavor size of the instance. Default is a SAN backed instance. Set local_disk variable to true if wanting to use a local-backed instance flavor. All profiles: https://cloud.ibm.com/docs/vsi?topic=virtual-servers-about-virtual-server-profiles"
  type        = "string"
  default     = "B1_2X4X100"
}

variable domain {
  description = "Domain name for instance."
  type        = "string"
  default     = ""
}

variable "hostname" {
  description = "Hostname of the instance."
  type        = "string"
  default     = ""
}

variable "ssh_key_name" {
  description = "The name of the IaaS SSH Key to add to the instance during provisioning."
  type        = "string"
  default     = ""
}

variable "local_disk" {
  description = "This determines if the instance is a san-backed or local-backed instance. Default is false. Set to true if using a local-backed flavor."
  type        = "string"
  default     = "false"
}
