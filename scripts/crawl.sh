#!/bin/bash -l
set -a
source SETTINGS.env
set +a
export local_dir=$DOCBAO_BASE_DIR
# export PYTHONPATH=$PYTHONPATH:$local_dir
# source $local_dir/docbao_env/bin/activate

echo "Start running crawler for the first time for testing posts data"
cd $local_dir

# start crawl
cd $local_dir/src/backend
# $local_dir/docbao_env/bin/python3 crawl.py
python3 crawl.py

# copy json data to frontend
cp -r $local_dir/src/backend/export/* $local_dir/src/frontend/export/

# release temp & lock
rm -f $local_dir/src/backend/docbao.lock
killall -9 firefox || true
killall geckodriver || true
echo "Stop crawler"

