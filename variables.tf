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
  type = "map"

  default = {
    us-south1 = "dal10"
    us-south2 = "dal12"
    us-south3 = "dal13"
    us-east1  = "wdc04"
    us-east2  = "wdc06"
    us-east3  = "wdc07"
    eu-de1    = "fra02"
    eu-de2    = "fra04"
    eu-de3    = "fra05"
    eu-lon1   = "lon04"
    eu-lon2   = "lon06"
    eu-lon3   = "lon05"
    apac1     = "tok02"
    apac2     = "tok04"
    apac3     = "tok05"
    aus1      = "syd01"
    aus2      = "syd04"
    aus3      = "syd05"
  }
}

variable os_reference_code {
  type = "map"

  default = {
    u16     = "UBUNTU_16_64"
    u18     = "UBUNTU_18_64"
    rhel6   = "REDHAT_6_64"
    rhel7   = "REDHAT_7_64"
    cent6   = "CENTOS_6_64"
    cent7   = "CENTOS_7_64"
    deb8    = "DEBIAN_8_64"
    deb9    = "DEBIAN_9_64"
    win2012 = "WIN_2012-STD_64"
    win2016 = "WIN_2016-STD_64"
    win2019 = "WIN_2019-STD_64"
  }
}

variable flavor_key_name {
  type = "map"

  default = {
    bsan-small    = "B1_2X4X100"
    bsan-medium   = "B1_8X16X100"
    bsan-large    = "B1_16X32X100"
    blocal-small  = "BL2_2X4X100"
    blocal-medium = "BL2_8X16X100"
    blocal-large  = "BL2_16X32X100"
  }
}

variable domain {
  type    = "string"
  default = ""
}

variable "hostname" {
  type    = "string"
  default = ""
}

variable "ssh_key_name" {
  type    = "string"
  default = ""
}

variable "local_disk" {
  type    = "string"
  default = "false"
}
