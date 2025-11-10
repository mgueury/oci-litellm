#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR/..

. starter.sh env -silent

get_ui_url

echo 
echo "Build done"

# Do not show the Done URLs if after_build.sh exists 
if [ "$UI_URL" != "" ]; then
  append_done "LiteLLM installed:"
  append_done "- URL: $UI_URL:8080/ui"

elif [ ! -f $FILE_DONE ]; then
  echo "-" > $FILE_DONE  
fi
cat $FILE_DONE  