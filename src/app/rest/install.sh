#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR

. $HOME/compote/shared_compute.sh
./env.sh

# https://yum.oracle.com/oracle-linux-python.html

install_python
install_nodejs

# LiteLLM bug
python -m prisma generate --schema myenv/lib64/python3.12/site-packages/litellm/proxy/schema.prisma

# Postgres (LiteLLM config)
sudo dnf install -y @postgresql
sudo /usr/bin/postgresql-setup --initdb
sudo systemctl enable postgresql
sudo sed -i "s/ident/md5/g" /var/lib/pgsql/data/pg_hba.conf
sudo systemctl restart postgresql

# . ./env.sh
# echo $DATABASE_URL
# sudo su - postgres
# psql 
# \l

cd /tmp
sudo -u postgres psql -c "CREATE USER litellm_user WITH ENCRYPTED PASSWORD '$TF_VAR_db_password';"
sudo -u postgres psql -c "ALTER USER litellm_user WITH PASSWORD '$TF_VAR_db_password';"
sudo -u postgres psql -c "CREATE DATABASE litellm_db OWNER litellm_user;"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE litellm_db TO litellm_user;"
cd -

# Config.yaml
sed -i "s/##TF_VAR_genai_api_key##/$TF_VAR_genai_api_key/" config.yaml
sed -i "s/##TF_VAR_region##/$TF_VAR_region/" config.yaml

# Patch DAC/Cohere
# cp myenv/lib64/python3.12/site-packages/litellm/llms/oci/chat/transformation.py myenv/lib64/python3.12/site-packages/litellm/llms/oci/chat/transformation.py.backup
# cp oci_litellm/transformation.py myenv/lib64/python3.12/site-packages/litellm/llms/oci/chat/transformation.py
