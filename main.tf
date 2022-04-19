provider "google" {

  project = var.project_id
  region  = var.region
  zone    = var.zone
  # version = "~> 3.86.0"
}


# ## https://registry.terraform.io/providers/hashicorp/vault/latest/docs#example-auth_login-usage
 provider "vault" {
   address = "https://vault-nonprod.cvshealth.com"
   auth_login {
     path = "auth/xenon-sandbox/login"

     parameters = {
       role_id   = var.login_approle_role_id
       secret_id = var.login_approle_secret_id
     }
   }

 }
