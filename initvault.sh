export VAULT_TOKEN=$1
export GITLAB_ACCESS_TOKEN=$(vault kv get -field gitlab_access_token -address https://vault.enpos.lan kv/terraform)
echo "Gitlab Token : ${GITLAB_ACCESS_TOKEN:0:8}..."