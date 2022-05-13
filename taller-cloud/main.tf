# resource "google_service_account" "default" {
#   account_id   = "service_account_id"
#   display_name = "Service Account"
# }
provider "google"{
  credentials = file("./project-gcloud-stf1-2db088dcbc14.json")
}


resource "google_compute_instance" "default" {
  name         = var.name
  project = var.project
  machine_type = var.machine_type
  zone         = var.location

  tags = ["proyecto", "Taller-GCloud-Stf1"]

  boot_disk {
    initialize_params {
    #   image = "debian-cloud/debian-9"
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  // Local SSD disk
#   scratch_disk {
#     interface = "SCSI"
#   }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    proyecto = "Taller-GCloud-Stf1"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = "stf-taller001@project-gcloud-stf1.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
}