#!/usr/bin/env sh

set -eu
echo "Extracting NDI libraries..."
sudo bash ../FFMPEG-NDI/handle_NDI_Advanced_SDK.sh

echo "Installing NDI libraries..."
cp "NDI Advanced SDK for Linux"/include/* /usr/include/
cp "NDI Advanced SDK for Linux"/lib/arm-newtek-linux-gnueabihf/* /usr/lib/

echo "Done"
