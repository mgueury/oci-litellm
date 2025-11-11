#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR/..

. starter.sh env -silent

get_ui_url

echo 
echo "Build done"

# Do not show the Done URLs if after_build.sh exists 
echo "URLs" > $FILE_DONE
append_done ""
append_done "LiteLLM UI:"
append_done "- $UI_URL:8080/ui"
append_done ""
append_done "OpenAI compatible URL"
append_done "- $UI_URL:8080/v1"
append_done "- https://${APIGW_HOSTNAME}/${TF_VAR_prefix}/v1"
append_done "APIKEY: $TF_VAR_db_password"
append_done "MODEL: oci_cohere_command_latest (see config.yaml)"

cat $FILE_DONE  