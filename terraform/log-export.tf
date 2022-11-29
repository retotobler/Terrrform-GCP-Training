module "logsink-logbucketsink" {
  source  = "terraform-google-modules/log-export/google"
  version = "~> 7.3.0"

  destination_uri      = module.avaloq-logging-ch-destination.destination_uri
  log_sink_name        = "logbucketsink"
  parent_resource_id   = var.org_id
  parent_resource_type = "organization"
  include_children     = true
}

module "avaloq-logging-ch-destination" {
  source  = "terraform-google-modules/log-export/google//modules/logbucket"
  version = "~> 7.4.1"

  project_id               = module.logging-cy211-rd708.project_id
  name                     = "avaloq-logging-ch"
  location                 = "europe-west6"
  retention_days           = 365
  log_sink_writer_identity = module.logsink-logbucketsink.writer_identity
}