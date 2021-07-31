# Rust-Server-IAC
Terraform + Ansible scripts to quickly standup a Rust game server

# Pre-requisites

1. ssh-key gen
2. AWS
3. Rust client

# To run

```
cd create
terraform init
export AWS_ACCESS_KEY_ID="anaccesskey"
export AWS_SECRET_ACCESS_KEY="asecretkey"
export TF_VAR_public_key="ssh-rsa asdasdcsca....."
terraform plan
terraform apply
```

Copy ip from terraform output to build/inventory.yaml
Set Steam admin credentails, server settings in build/playbook.yaml

```
cd build
ansible-playbook playbook.yaml -i inventory.yaml
```
