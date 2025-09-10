terraform {
  backend "gcs" {
    bucket = "bkt-prj-seed-iac-terraform-prod"
    prefix = "terraform/state/prod/siemens/se-acn-managedcloud/fldr-non-external/fldr-prod/prj-acn-prd-arfac/firewallrules"
    impersonate_service_account = "sa-terraformer@prj-sa-acn.iam.gserviceaccount.com"
  }
}