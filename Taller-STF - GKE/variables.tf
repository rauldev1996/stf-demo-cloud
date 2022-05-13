variable "name" {
  default = "cluster-1"
}

variable "project" {
  default = "taller-cloud"
}

variable "machine_type" {
  default = "e2-micro"
}

variable "location" {
  default = "us-central1"
}

variable "initial_node_count" {
  default = 1
}

variable "client-mail" {
  default = "995517337835-compute@developer.gserviceaccount.com"
}

variable "name-pool" {
  default = "gke-pool1"
}