if grep -q 'TF_VAR_genai_api_key' $TARGET_DIR/tf_env.sh; then
    echo "tf_env.sh already modified"
else 
    append_tf_env "export TF_VAR_genai_api_key=\"$TF_VAR_genai_api_key\""
fi
