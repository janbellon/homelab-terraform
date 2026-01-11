export VAULT_TOKEN=$1
export GITLAB_ACCESS_TOKEN=$(vault kv get -tls-skip-verify -field gitlab_access_token -address https://vault.srv.nbl.lan kv/terraform)
export AWS_ACCESS_KEY_ID=$(vault kv get -tls-skip-verify -field access_key -address https://vault.srv.nbl.lan kv/s3/terraform)
export AWS_SECRET_ACCESS_KEY=$(vault kv get -tls-skip-verify -field secret_key -address https://vault.srv.nbl.lan kv/s3/terraform)
echo "Gitlab Token : ${GITLAB_ACCESS_TOKEN:0:8}..."
echo "S3_ACCESS_KEY : ${AWS_ACCESS_KEY_ID:0:8}..."
echo "S3_SECRET_KEY : ${AWS_SECRET_ACCESS_KEY:0:8}..."