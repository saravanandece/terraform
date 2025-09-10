terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.0.0"
    }
  }
}
provider "google" {
  alias= "tokengen"
}

data "google_client_config" "default" {
  provider = google.tokengen
}
data "google_service_account_access_token" "sa" {
  provider               = google.tokengen
  target_service_account = "sa-terraformer@prj-sa-acn.iam.gserviceaccount.com"
  lifetime               = "3600s"
scopes = [
    "https://www.googleapis.com/auth/cloud-platform",
    "https://www.googleapis.com/auth/userinfo.email"
  ]
}
/******************************************
  GA Provider configuration
 *****************************************/
provider "google" {
  access_token = data.google_service_account_access_token.sa.access_token
}
/******************************************
  Beta Provider configuration
 *****************************************/
provider "google-beta" {
  access_token = data.google_service_account_access_token.sa.access_token
}