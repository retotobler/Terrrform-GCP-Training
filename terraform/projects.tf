module "logging-cy211-rd708" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "logging"
  project_id = "logging-cy211-rd708"
  org_id     = var.org_id
  folder_id  = google_folder.common.name

  billing_account = var.billing_account
}

module "monitoring-dev-cy211-rd708" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "monitoring-dev"
  project_id = "monitoring-dev-cy211-rd708"
  org_id     = var.org_id
  folder_id  = google_folder.common.name

  billing_account = var.billing_account
}

module "monitoring-nonprod-cy211-rd708" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "monitoring-nonprod"
  project_id = "monitoring-nonprod-cy211-rd708"
  org_id     = var.org_id
  folder_id  = google_folder.common.name

  billing_account = var.billing_account
}

module "monitoring-prod-cy211-rd708" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "monitoring-prod"
  project_id = "monitoring-prod-cy211-rd708"
  org_id     = var.org_id
  folder_id  = google_folder.common.name

  billing_account = var.billing_account
}

module "vpc-host-dev-cy211-rd708" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "vpc-host-dev"
  project_id = "vpc-host-dev-cy211-rd708"
  org_id     = var.org_id
  folder_id  = google_folder.common.name

  billing_account = var.billing_account
}

module "vpc-host-nonprod-cy211-rd708" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "vpc-host-nonprod"
  project_id = "vpc-host-nonprod-cy211-rd708"
  org_id     = var.org_id
  folder_id  = google_folder.common.name

  billing_account = var.billing_account
}

module "vpc-host-prod-cy211-rd708" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "vpc-host-prod"
  project_id = "vpc-host-prod-cy211-rd708"
  org_id     = var.org_id
  folder_id  = google_folder.common.name

  billing_account = var.billing_account
}
