terraform {
  required_providers {
    oci = {
      source  = "hashicorp/oci"
      version = ">=4.38.0"
    }
  }
  required_version = ">= 1.0.0"
}
