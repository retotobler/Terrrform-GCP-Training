# VPC and Subnets
module "clientzz-envxx-based" {
    source  = "terraform-google-modules/network/google"
    version = "~> 5.0"

    project_id   = module.vpc-host-prod-cy211-rd708.project_id
    network_name = "clientzz-envxx-based"
    routing_mode = "GLOBAL"

    subnets = [
       
        {
            subnet_name           = "clientzz-envxx-aaaa"
            subnet_ip             = "10.0.0.0/22"
            subnet_region         = "europe-west6"
            subnet_private_access = true
            subnet_flow_logs      = true
            subnet_flow_logs_sampling = "0.5"
            subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
            subnet_flow_logs_interval = "INTERVAL_10_MIN"
        },
        {
            subnet_name           = "clientzz-envxx-bbbb"
            subnet_ip             = "10.0.16.0/22"
            subnet_region         = "europe-west3"
            subnet_private_access = true
            subnet_flow_logs      = true
            subnet_flow_logs_sampling = "0.5"
            subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
            subnet_flow_logs_interval = "INTERVAL_10_MIN"
        },
    ]
}
# Firewall Rules
resource "google_compute_firewall" "clientzz-envxx-based-allow-iap-rdp" {
  name      = "clientzz-envxx-based-allow-iap-rdp"
  network   = module.clientzz-envxx-based.network_name
  project   = module.vpc-host-prod-cy211-rd708.project_id
  direction = "INGRESS"
  priority  = 10000

  log_config {
      metadata = "INCLUDE_ALL_METADATA"
    }

  allow {
    protocol = "tcp"
    ports    = ["3389",]
  }

  source_ranges = [
  "35.235.240.0/20",
  ]
}
resource "google_compute_firewall" "clientzz-envxx-based-allow-iap-ssh" {
  name      = "clientzz-envxx-based-allow-iap-ssh"
  network   = module.clientzz-envxx-based.network_name
  project   = module.vpc-host-prod-cy211-rd708.project_id
  direction = "INGRESS"
  priority  = 10000

  log_config {
      metadata = "INCLUDE_ALL_METADATA"
    }

  allow {
    protocol = "tcp"
    ports    = ["22",]
  }

  source_ranges = [
  "35.235.240.0/20",
  ]
}
resource "google_compute_firewall" "clientzz-envxx-based-allow-icmp" {
  name      = "clientzz-envxx-based-allow-icmp"
  network   = module.clientzz-envxx-based.network_name
  project   = module.vpc-host-prod-cy211-rd708.project_id
  direction = "INGRESS"
  priority  = 10000

  log_config {
      metadata = "INCLUDE_ALL_METADATA"
    }

  allow {
    protocol = "icmp"
  }

  source_ranges = [
  "10.128.0.0/9",
  ]
}
# NAT Router and config

# VPC and Subnets
module "vpc-host-dev" {
    source  = "terraform-google-modules/network/google"
    version = "~> 5.0"

    project_id   = module.vpc-host-dev-cy211-rd708.project_id
    network_name = "vpc-host-dev"
    routing_mode = "GLOBAL"

    subnets = [
       
        {
            subnet_name           = "subnet-dev-backend"
            subnet_ip             = "10.2.16.0/22"
            subnet_region         = "europe-west3"
            subnet_private_access = true
            subnet_flow_logs      = true
            subnet_flow_logs_sampling = "0.5"
            subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
            subnet_flow_logs_interval = "INTERVAL_10_MIN"
        },
        {
            subnet_name           = "subnet-dev-frontend"
            subnet_ip             = "10.2.0.0/22"
            subnet_region         = "europe-west6"
            subnet_private_access = true
            subnet_flow_logs      = true
            subnet_flow_logs_sampling = "0.5"
            subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
            subnet_flow_logs_interval = "INTERVAL_10_MIN"
        },
    ]
}
# Firewall Rules
resource "google_compute_firewall" "vpc-host-dev-allow-iap-rdp" {
  name      = "vpc-host-dev-allow-iap-rdp"
  network   = module.vpc-host-dev.network_name
  project   = module.vpc-host-dev-cy211-rd708.project_id
  direction = "INGRESS"
  priority  = 10000

  log_config {
      metadata = "INCLUDE_ALL_METADATA"
    }

  allow {
    protocol = "tcp"
    ports    = ["3389",]
  }

  source_ranges = [
  "35.235.240.0/20",
  ]
}
resource "google_compute_firewall" "vpc-host-dev-allow-iap-ssh" {
  name      = "vpc-host-dev-allow-iap-ssh"
  network   = module.vpc-host-dev.network_name
  project   = module.vpc-host-dev-cy211-rd708.project_id
  direction = "INGRESS"
  priority  = 10000

  log_config {
      metadata = "INCLUDE_ALL_METADATA"
    }

  allow {
    protocol = "tcp"
    ports    = ["22",]
  }

  source_ranges = [
  "35.235.240.0/20",
  ]
}
resource "google_compute_firewall" "vpc-host-dev-allow-icmp" {
  name      = "vpc-host-dev-allow-icmp"
  network   = module.vpc-host-dev.network_name
  project   = module.vpc-host-dev-cy211-rd708.project_id
  direction = "INGRESS"
  priority  = 10000

  log_config {
      metadata = "INCLUDE_ALL_METADATA"
    }

  allow {
    protocol = "icmp"
  }

  source_ranges = [
  "10.128.0.0/9",
  ]
}
# NAT Router and config

# VPC and Subnets
module "vpc-host-nonprod" {
    source  = "terraform-google-modules/network/google"
    version = "~> 5.0"

    project_id   = module.vpc-host-nonprod-cy211-rd708.project_id
    network_name = "vpc-host-nonprod"
    routing_mode = "GLOBAL"

    subnets = [
       
        {
            subnet_name           = "subnet-non-prod-backend"
            subnet_ip             = "10.1.16.0/22"
            subnet_region         = "europe-west3"
            subnet_private_access = true
            subnet_flow_logs      = true
            subnet_flow_logs_sampling = "0.5"
            subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
            subnet_flow_logs_interval = "INTERVAL_10_MIN"
        },
        {
            subnet_name           = "subnet-non-prod-frontend"
            subnet_ip             = "10.1.0.0/22"
            subnet_region         = "europe-west6"
            subnet_private_access = true
            subnet_flow_logs      = true
            subnet_flow_logs_sampling = "0.5"
            subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
            subnet_flow_logs_interval = "INTERVAL_10_MIN"
        },
    ]
}
# Firewall Rules
resource "google_compute_firewall" "vpc-host-nonprod-allow-iap-rdp" {
  name      = "vpc-host-nonprod-allow-iap-rdp"
  network   = module.vpc-host-nonprod.network_name
  project   = module.vpc-host-nonprod-cy211-rd708.project_id
  direction = "INGRESS"
  priority  = 10000

  log_config {
      metadata = "INCLUDE_ALL_METADATA"
    }

  allow {
    protocol = "tcp"
    ports    = ["3389",]
  }

  source_ranges = [
  "35.235.240.0/20",
  ]
}
resource "google_compute_firewall" "vpc-host-nonprod-allow-iap-ssh" {
  name      = "vpc-host-nonprod-allow-iap-ssh"
  network   = module.vpc-host-nonprod.network_name
  project   = module.vpc-host-nonprod-cy211-rd708.project_id
  direction = "INGRESS"
  priority  = 10000

  log_config {
      metadata = "INCLUDE_ALL_METADATA"
    }

  allow {
    protocol = "tcp"
    ports    = ["22",]
  }

  source_ranges = [
  "35.235.240.0/20",
  ]
}
resource "google_compute_firewall" "vpc-host-nonprod-allow-icmp" {
  name      = "vpc-host-nonprod-allow-icmp"
  network   = module.vpc-host-nonprod.network_name
  project   = module.vpc-host-nonprod-cy211-rd708.project_id
  direction = "INGRESS"
  priority  = 10000

  log_config {
      metadata = "INCLUDE_ALL_METADATA"
    }

  allow {
    protocol = "icmp"
  }

  source_ranges = [
  "10.128.0.0/9",
  ]
}
# NAT Router and config
