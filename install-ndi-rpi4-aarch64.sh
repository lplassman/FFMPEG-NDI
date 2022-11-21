#!/usr/bin/env sh

set -eu
echo "Downloading NDI libraries..."
sudo bash ../FFMPEG-NDI/download_NDI_SDK.sh

echo "Installing NDI libraries..."
sudo cp -R "NDI SDK for Linux"/include/* /usr/include/
sudo cp -R "NDI SDK for Linux"/lib/aarch64-rpi4-linux-gnueabi/* /usr/lib/

echo "Done"
