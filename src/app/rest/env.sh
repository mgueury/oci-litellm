# Environment Variables
# The values between ##xxx## will be filled during build.

export LITELLM_MASTER_KEY=$TF_VAR_db_password
export LITELLM_SALT_KEY=$TF_VAR_db_password
export PORT=8080
export STORE_MODEL_IN_DB='True'

export UI_USERNAME=admin
export UI_PASSWORD=$TF_VAR_db_password
export DATABASE_URL="postgresql://litellm_user:$TF_VAR_db_password@localhost:5432/litellm_db"


