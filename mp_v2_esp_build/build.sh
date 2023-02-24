#!/bin/bash

# install esp-idf
sudo apt update
sudo apt-get install -y git wget flex bison gperf python3 python3-venv cmake ninja-build ccache libffi-dev libssl-dev dfu-util libusb-1.0-0
mkdir -p ~/esp
cd ~/esp
git clone -b release/v5.0 --recursive https://github.com/espressif/esp-idf.git
cd ~/esp/esp-idf
./install.sh esp32s3
./install.sh all
echo ". ~/esp/esp-idf/export.sh" >> ~/.bashrc

source ~/esp/esp-idf/export.sh
cd ~
git clone https://github.com/mangdangroboticsclub/mini_pupper_2_bsp.git
cd ~/mini_pupper_2_bsp/esp32
idf.py set-target esp32s3
idf.py build
cp build/mini_pupper_app.bin ~/
