provider "oci" {
  region = local.region
}

locals {
  region = "eu-frankfurt-1"
  suffix = "mywplab"
  tags = {
    Environment = "prod"
    Owner       = "team@example.com"
    Project     = "wordpress-ha"
  }
}

module "compartment" {
  source               = "./modules/compartment"
  parent_compartment_id = var.tenancy_ocid
  name                 = "cmp-${local.suffix}"
  description          = "Compartment for WordPress HA workload"
  tags                 = local.tags
}

module "network" {
  source         = "./modules/network"
  compartment_id = module.compartment.compartment_id
  name           = local.suffix
  tags           = local.tags
}

module "load_balancer" {
  source         = "./modules/load_balancer"
  compartment_id = module.compartment.compartment_id
  name           = local.suffix
  subnet_id      = module.network.subnet_id
  tags           = local.tags
}

module "file_storage" {
  source              = "./modules/file_storage"
  compartment_id      = module.compartment.compartment_id
  suffix              = local.suffix
  subnet_id           = module.network.subnet_id
  availability_domain = var.availability_domain
  tags                = local.tags
}

module "object_storage" {
  source         = "./modules/object_storage"
  compartment_id = module.compartment.compartment_id
  suffix         = local.suffix
  tags           = local.tags
}

module "compute" {
  source              = "./modules/compute"
  compartment_id      = module.compartment.compartment_id
  name                = local.suffix
  subnet_id           = module.network.subnet_id
  availability_domain = var.availability_domain
  ssh_public_key      = var.ssh_public_key
  user_data = base64encode(templatefile("${path.root}/script.tpl", {
    mount_target_ip = module.file_storage.mount_target_ip
    export_path     = module.file_storage.export_path
  }))
  pool_size            = 3
  min_size             = 3
  max_size             = 4
  shape                = "VM.Standard.E4.Flex"
  ocpus                = 2
  memory_in_gbs        = 16
  load_balancer_id     = module.load_balancer.load_balancer_id
  backend_set_name     = module.load_balancer.backend_set_name
  tags                 = local.tags

  depends_on = [module.file_storage]
}

module "postgresql" {
  source              = "./modules/postgresql"
  compartment_id      = module.compartment.compartment_id
  suffix              = local.suffix
  subnet_id           = module.network.subnet_id
  availability_domain = var.availability_domain
  db_admin_username   = "adminsiteswordpress"
  db_admin_password   = var.database_admin_password
  tags                = local.tags
}
