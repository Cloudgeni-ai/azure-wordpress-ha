terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "~> 5.0"
    }
  }

  # Remote state via OCI Object Storage (S3-compatible)
  # Uncomment and configure once OCI credentials are available:
  # backend "s3" {
  #   bucket                      = "terraform-state-mywplab"
  #   key                         = "oci-wordpress-ha.tfstate"
  #   region                      = "eu-frankfurt-1"
  #   endpoint                    = "https://<namespace>.compat.objectstorage.eu-frankfurt-1.oraclecloud.com"
  #   shared_credentials_file     = "~/.aws/credentials"
  #   skip_credentials_validation = true
  #   skip_metadata_api_check     = true
  #   skip_region_validation      = true
  #   force_path_style            = true
  # }
}
