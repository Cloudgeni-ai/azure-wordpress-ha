data "oci_core_images" "ubuntu" {
  compartment_id           = var.compartment_id
  operating_system         = "Canonical Ubuntu"
  operating_system_version = "22.04"
  shape                    = var.shape
  sort_by                  = "TIMECREATED"
  sort_order               = "DESC"
  state                    = "AVAILABLE"
}

resource "oci_core_instance_configuration" "config" {
  compartment_id = var.compartment_id
  display_name   = "ic-${var.name}"
  freeform_tags  = var.tags

  instance_details {
    instance_type = "compute"

    launch_details {
      compartment_id = var.compartment_id
      display_name   = "instance-${var.name}"
      shape          = var.shape

      shape_config {
        ocpus         = var.ocpus
        memory_in_gbs = var.memory_in_gbs
      }

      source_details {
        source_type = "image"
        image_id    = data.oci_core_images.ubuntu.images[0].id
      }

      create_vnic_details {
        subnet_id        = var.subnet_id
        assign_public_ip = true
      }

      metadata = {
        ssh_authorized_keys = var.ssh_public_key
        user_data           = var.user_data
      }

      freeform_tags = var.tags
    }
  }
}

resource "oci_core_instance_pool" "pool" {
  compartment_id            = var.compartment_id
  instance_configuration_id = oci_core_instance_configuration.config.id
  size                      = var.pool_size
  display_name              = "ip-${var.name}"
  freeform_tags             = var.tags

  placement_configurations {
    availability_domain = var.availability_domain
    primary_subnet_id   = var.subnet_id
  }

  load_balancers {
    backend_set_name = var.backend_set_name
    load_balancer_id = var.load_balancer_id
    port             = 80
    vnic_selection   = "PrimaryVnic"
  }
}

resource "oci_autoscaling_auto_scaling_configuration" "asc" {
  compartment_id       = var.compartment_id
  display_name         = "asc-${var.name}"
  is_enabled           = true
  cool_down_in_seconds = 900
  freeform_tags        = var.tags

  resource {
    type = "instancePool"
    id   = oci_core_instance_pool.pool.id
  }

  policies {
    display_name = "cpu-autoscaling-${var.name}"
    policy_type  = "threshold"

    capacity {
      initial = var.pool_size
      min     = var.min_size
      max     = var.max_size
    }

    rules {
      display_name = "scale-out-cpu-gt-75"

      action {
        type  = "CHANGE_COUNT_BY"
        value = 1
      }

      metric {
        metric_type = "CPU_UTILIZATION"

        threshold {
          operator = "GT"
          value    = 75
        }
      }
    }

    rules {
      display_name = "scale-in-cpu-lt-30"

      action {
        type  = "CHANGE_COUNT_BY"
        value = -1
      }

      metric {
        metric_type = "CPU_UTILIZATION"

        threshold {
          operator = "LT"
          value    = 30
        }
      }
    }
  }
}
