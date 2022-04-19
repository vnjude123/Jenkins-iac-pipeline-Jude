 data "vault_generic_secret" "vault_secret_bucket_name" {
   path = "xenon-sandbox/terraform/digital-dfp-dev/global/avalanche"
 }

module "cloud_Storage" {
  source = "git::ssh://git@gitw.cvshealth.com/da/dfp/terraform-modules/approved-for-use/terraform-google-cloudstorage.git?ref=v0.1.0"

  project_id                       = var.project_id
  region                           = var.region
  zone                             = var.zone
  bucket_name                      = data.vault_generic_secret.vault_secret_bucket_name.data["bucket1"]
  #bucket_name                      = var.bucket_name
  bucket_location                  = var.bucket_location
  bucket_labels                    = var.bucket_labels
  bucket_encryption_key            = var.bucket_encryption_key
  lifecycle_delete_age_rules       = var.lifecycle_delete_age_rules
  lifecycle_storageclass_age_rules = var.lifecycle_storageclass_age_rules
  access                           = var.access
  enable_versioning=var.enable_versioning

  retention_policy_values = var.retention_policy_values


  log_bucket_name = var.log_bucket_name
}
