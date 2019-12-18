variable "iaas_classic_username" {
  description = "Enter the user name to access IBM Cloud classic infrastructure. You can retrieve the user name by following the instructions for retrieving your classic infrastructure API key."
}

variable "iaas_classic_api_key" {
  description = "Enter the API key to access IBM Cloud classic infrastructure. For more information for how to create an API key and retrieve it, see [Managing classic infrastructure API keys](https://cloud.ibm.com/docs/iam?topic=iam-classic_keys)."
}

variable "ibmcloud_api_key" {
  description = "Enter your IBM Cloud API Key, you can get your IBM Cloud API key using: https://cloud.ibm.com/iam#/apikeys"
}

   
variable "resource_group" {
  description = "The name of the resource group your Cloud Internet Services offering is deployed in to."
}

variable datacenter {
  description = "The IBM Cloud datacenter to provision the instance. Full list [here](https://cloud.ibm.com/docs/resources?topic=resources-services_region#iaas-service-infra)"
  type        = "string"
  default     = "wdc06"
}

variable os_reference_code {
  description = "The Operating System to provision. Currently only supported for UBUNTU_16_64 and UBUNTU_18_64"
  type        = "string"
  default     = "UBUNTU_18_64"
}

variable flavor_key_name {
  description = "The flavor size of the instance. Default is a SAN backed instance. Set local_disk variable to true if wanting to use a local-backed instance flavor. [All profiles](https://cloud.ibm.com/docs/vsi?topic=virtual-servers-about-virtual-server-profiles)"
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
