export TF_VAR_login_approle_role_id=$(cat ${vault_app_role_id})
export TF_VAR_login_approle_secret_id=$(cat ${vault_secret_id})

mkdir -p /home/cmadmin/.ssh
ls -l /home/cmadmin/.ssh
cp ${id_rsa} /home/cmadmin/.ssh/id_rsa
ssh-keyscan gitw.cvshealth.com > /home/cmadmin/.ssh/known_hosts
chmod -R go-rwx /home/cmadmin/.ssh

export GOOGLE_APPLICATION_CREDENTIALS=${deployKeyFile}

echo "Running tf plan:"
gcp-iac-pipeline-cli plan --dir "." --varfile tfvars/${env_vars}.tfvars 

echo "Ending plan output"

echo "Running tf apply"

gcp-iac-pipeline-cli apply --dir "." --plan-output-file plan_output.binary

echo "Ending tf apply"
