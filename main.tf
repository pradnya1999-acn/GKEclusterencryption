provider "google" {
#   version = "= 3.55.0"
  credentials = var.sa_key
  project = "parabolic-base-409505"
}
 
variable "sa_key" {
  default =  ""
}
resource "google_container_cluster" "primary" {
  name     = "my-gke-cluster"
  location = "us-central1"
  remove_default_node_pool = true
  initial_node_count       = 1

 database_encryption {
   state = "ENCRYPTED"
   key_name = "projects/parabolic-base-409505/locations/us-central1/keyRings/secret-keyring/cryptoKeys/secret-key"
}
}
