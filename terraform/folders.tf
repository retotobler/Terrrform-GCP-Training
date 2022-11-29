resource "google_folder" "acc" {
  display_name = "ACC"
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "common" {
  display_name = "Common"
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "dev" {
  display_name = "DEV"
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "prd" {
  display_name = "PRD"
  parent       = "organizations/${var.org_id}"
}
