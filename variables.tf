#main.tf vars
variable "project_id" {
  description = "The project ID to manage the Cloud SQL resources"
  type        = string
  default     = ""
}

variable "region" {
  description = "The region of the Cloud SQL resources"
  type        = string
  default     = ""
}

variable "zone" {
  description = "The zone for the master instance, it should be something like: `us-central1-a`, `us-east1-c`."
  type        = string
  default     = ""
}


### vault provider

variable login_approle_role_id {
  description = "Vault AppRole role id"
  type        = string
  sensitive   = true
  default = ""
}

variable login_approle_secret_id {
  description = "Vault AppRole secret id"
  type        = string
  sensitive   = true
  default = ""
}



### Cloud Storage Vars
# variable "project_id" {
#   description = "The project ID to manage the Cloud SQL resources"
#   type    = string
# }

# variable "region" {
#   type    = string
#   description = "The name of the Cloud SQL resources"
# }

# variable "zone" {
#   type    = string
#   description = "The zone for the master instance, it should be something like: `us-central1-a`, `us-east1-c`."
# }

#variable "bucket_list" {
#  type = list(object({
#    bucket_name                      = string,
#    bucket_location                  = string,
#    bucket_storage_class             = string,
#    requester_pays_enabled           = bool,
#    bucket_labels                    = map(string),
#    bucket_encryption_key            = list(string),
#    lifecycle_delete_age_rules       = list(number),
#    lifecycle_storageclass_age_rules = list(map(string)),
#    access                           = list(any)
#  }))
#}

variable "bucket_name" {
  type = string
  description = "Name of the cloudstorage bucket"
}

variable "bucket_location" {
  type = string
  description = "Region of the cloudstorage bucket"
}

variable "bucket_labels" {
  description = "requester_pays_enabled set to false"
  type        = map(string)
}

variable "bucket_encryption_key" {
  type = list(string)
  description = "Key to encrypt contents of the bucket."
  default = [null]
}

variable "lifecycle_delete_age_rules" {
  type = list(number)
  description = "Lifecycle age to delete the bucket."
}

variable "lifecycle_storageclass_age_rules" {
  type = list(map(string))
  description = "Lifecycle Bucket storage."
}

variable "access" {
  type = list(any)
  description = "Bucket access based on role."
}

variable "log_bucket_name" {
  type = string
  description = "Name of the Bucket used to store access logs"
}


#Default
variable "enable_versioning" {
  description = "Enable GCS Bucket versioning."
  type        = bool
}

variable "retention_policy_values" {
  description = "Configuration of the bucket's data retention policy for how long objects in the bucket should be retained."
  type = object({
    is_locked        = bool
    retention_period = number
  })
  default = {
    is_locked        = false
    retention_period = 5
  }
}
