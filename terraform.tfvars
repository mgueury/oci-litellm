# -- Variables ---------------------------------------------

# Prefix to all resources created by terraform
prefix="litellm"

# Compartment
compartment_ocid="__TO_FILL__"

# LiteLLM 
db_password="__TO_FILL__"

# Configure also 
# - src/config.yaml
# - oci_api_key.pem
#
# See: 
# -
# - https://raw.githubusercontent.com/BerriAI/litellm/refs/heads/main/litellm/llms/oci/chat/transformation.py