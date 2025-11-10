#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR

# https://yum.oracle.com/oracle-linux-python.html

sudo dnf install -y python3.12 python3.12-pip python3-devel
# sudo pip3.12 install pip --upgrade
sudo update-alternatives --set python /usr/bin/python3.12
curl -LsSf https://astral.sh/uv/install.sh | sh

# Postgres (LiteLLM config)
sudo dnf install -y @postgresql
sudo /usr/bin/postgresql-setup --initdb
sudo systemctl enable postgresql
sudo systemctl start postgresql
cd /tmp
sudo -u postgres psql -c "CREATE USER litellm_user WITH ENCRYPTED PASSWORD "$TF_VAR_db_password";"
sudo -u postgres psql -c "CREATE DATABASE litellm_db OWNER litellm_user;"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE litellm_db TO litellm_user;"
cd -

# Install virtual env python_env
uv venv myenv
source myenv/bin/activate
uv pip install -r requirements.txt


sudo -u postgres psql -c "echo '$TF_VAR_db_password';"