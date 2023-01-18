terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.47.0"
    }
  }

  backend "gcs" {
    bucket = "outbestinc-bucket"
  }
}

provider "google" {
  project = var.project_id
  region = var.region
}

resource "google_service_account" "default" {
  account_id   = "${var.name}-sa"
  display_name = "${var.name}-sa"
}

resource "google_container_cluster" "main" {
  for_each           =  var.cluster-count
  name               = "${each.value}-cluster"
  location           = var.location
  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  for_each   =  var.cluster-count
  name       = "${each.value}-node-pool"
  location   = var.location
  cluster    = google_container_cluster.main["each.key"].name
  node_count = 2

  node_config {
    preemptible  = true
    machine_type = var.machine-type

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.default.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}