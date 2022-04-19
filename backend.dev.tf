terraform {
  backend "gcs" {
    # The xenon-sandbox-tf-state bucket is just for storing tfstate file for
    # team Xenon/Avalache during development.  Any resources created which are
    # in tfstate in this bucket should be considered to be deletable at any time.
    bucket = "xenon-sandbox-tf-state"
    # each repo needs to use a unique prefix
    prefix = "gcp-iac-pipeline-cli"
  }
}
