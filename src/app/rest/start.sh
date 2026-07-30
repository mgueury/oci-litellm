#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR
. $HOME/compute/shared_compute.sh
. ./env.sh

source myenv/bin/activate
export PROXY_BASE_URL=https://${APIGW_HOSTNAME}
litellm --port 8080 --config config.yaml --detailed_debug 2>&1 | tee rest.log
