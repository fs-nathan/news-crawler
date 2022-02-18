################################################################################
# File: install.sh
#################################################################################

echo "INSTALL DOCBAO ON UBUNTU"
echo "__________________________________________________________________________"

echo "IMPORTANT!!!"
echo "REMEMBER TO RUN source SETTINGS.env BEFORE RUN THIS SCRIPT !!!"

set -a 
source SETTINGS.env
set +a 
export install_dir=$DOCBAO_BASE_DIR
# export PYTHONPATH=$PYTHONPATH:$local_dir
cd $install_dir
sleep 1
echo "__________________________________________________________________________"
echo " "
echo "Step 1: Ensure python3, pip3, venv, curl and php are installed"
echo "__________________________________________________________________________"
sleep 1
sudo apt update
sudo apt-get install build-essential
sudo apt-get install libpq5=12.9-0ubuntu0.20.04.1
sudo apt-get install libpq-dev python-dev libxml2-dev libxslt1-dev libldap2-dev libsasl2-dev libffi-dev
sudo apt install python3
sudo apt install python3-pip
sudo apt-get install python3-venv python3-wheel python3-dev
sudo apt install curl
sudo apt install php7.2-cli
sudo apt install php7.2-mbstring
sleep 1
echo "__________________________________________________________________________"
echo " "
echo "Step 2: activate docbao virtual environment & install libraries"
echo "__________________________________________________________________________"
# echo "It's OK to see the error: command 'x86_64-linux-gnu-gcc' failed with exit status 1"
sleep 10
cd $install_dir
# python3 -m venv docbao_env
# source $install_dir/docbao_env/bin/activate
# $install_dir/docbao_env/bin/python3 -m pip install wheel
# $install_dir/docbao_env/bin/python3 -m pip install -r requirements.txt
pip3 install wheel
# pip3 install python-crfsuite==0.9.5
pip3 install beautifulsoup4==4.6.3 jsonpickle==1.0 lxml==4.6.3 nltk==3.3 PyYAML==5.4 requests==2.18.4 selenium==3.141.0 underthesea==1.3.4 XlsxWriter==1.1.1 PyVirtualDisplay==0.2.1 xvfbwrapper==0.2.9 bs4==0.0.1 psutil==5.7.2 elasticsearch-dsl==6.3.1 epdb==0.15.1 pika==1.0.1 Flask==1.1.1 PyJWT==1.7.1 boto3==1.9.210 botocore==1.12.210 pytz==2019.2
pip3 install opencv-python-headless==4.4.0.44 textdistance==4.1.4 python-wordpress-xmlrpc==2.3 psycopg2-binary==2.8.6 SQLAlchemy==1.3.22
sleep 1
# echo "Reinstalling one more time to make sure dependencies installation..."
# pip3 install beautifulsoup4==4.6.3 jsonpickle==1.0 lxml==4.6.3 nltk==3.3 PyYAML==5.4 requests==2.18.4 selenium==3.141.0 underthesea==1.3.4 XlsxWriter==1.1.1 PyVirtualDisplay==0.2.1 xvfbwrapper==0.2.9 bs4==0.0.1 psutil==5.7.2 elasticsearch-dsl==6.3.1 epdb==0.15.1 pika==1.0.1 Flask==1.1.1 PyJWT==1.7.1 boto3==1.9.210 botocore==1.12.210 pytz==2019.2
# pip3 install opencv-python-headless==4.4.0.44 textdistance==4.1.4 python-wordpress-xmlrpc==2.3 psycopg2-binary==2.8.6 SQLAlchemy==1.3.22
# sleep 1
echo "__________________________________________________________________________"
echo " "
echo "Step 3: install firefox and xvfb"
echo "__________________________________________________________________________"
sleep 1
sudo apt install firefox
sudo apt install xvfb
sleep 1
echo "__________________________________________________________________________"
echo " "
echo "Step 4: copy resources files"
echo "__________________________________________________________________________"
sleep 1
sudo cp $install_dir/resources/firefox_driver/ubuntu/geckodriver /usr/bin
cp $install_dir/resources/firefox_extension/adblock.xpi $install_dir/src/backend/input
cp $install_dir/resources/configs/templates/default/config.yaml $install_dir/src/backend/input
sleep 1
echo "__________________________________________________________________________"
echo " "
echo "Step 5: run test"
echo "__________________________________________________________________________"
sleep 1
cd $install_dir/src/backend
# $install_dir/docbao_env/bin/python3 test.py
python3 test.py
sleep 1
echo "Finish Setup!"
