variable "gcp_service_list" {
  description = "Apis needed"
  type = list(string)
  default = [
    "container.googleapis.com",
    "compute.googleapis.com",
    "iap.googleapis.com",


  ]
}


resource "google_project_service" "gcp_service"{
  project = var.project_id

  for_each = toset(var.gcp_service_list)
  service = each.key

  disable_dependent_services = true
}