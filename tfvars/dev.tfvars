#main.tf input vars
region              = "us-west2"
zone                = "us-west2-b"
project_id          = "digital-dfp-dev"


### Cloud Storage Input Vars

#Mandatory
# project_id              = "digital-dfp-dev"
# region                  = "us-east4"
# zone                    = "us-east4-b"
retention_policy_values = {
  is_locked        = false
  retention_period = 3600
}

#enable_versioning = true

bucket_name                      = "bucket-avalanche-poplarj-branch-strategy-01"
bucket_location                  = "us-east4"
# bucket_storage_class             = "Standard"
lifecycle_delete_age_rules       = [5]
lifecycle_storageclass_age_rules = [
  {
    "age"          = 10
    "storageClass" = "STANDARD"
  }
]
bucket_encryption_key            = [
  "projects/digital-dfp-dev/locations/us-east4/keyRings/digital-dfp-dev-terratest/cryptoKeys/digital-dfp-dev-terratest"
]
bucket_labels                    = {
  "itpr"        = "avalanche"
  "costcenter"  = "dfp"
  "owner"       = "dfp"
  "application" = "avalanche-poc"
}
access                           = [
  {
    role    = "roles/storage.objectAdmin"
    members = ["serviceAccount:pegasus-poc-sa@digital-dfp-dev.iam.gserviceaccount.com"]
  }
]
log_bucket_name = "bucket-pegasus-test5"
enable_versioning=false