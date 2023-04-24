# FFMPEG NDI

Builds FFMPEG with NDI enabled

### Download required installation files

Make sure git is installed.

```
sudo apt update
sudo apt install git
```
Clone this repository

```
git clone https://github.com/lplassman/FFMPEG-NDI.git
```

Clone the FFMPEG repository and `cd` into it

```
git clone https://git.ffmpeg.org/ffmpeg.git && cd ffmpeg
```

Checkout 4.4 or later version of FFMPEG
```
git checkout n5.1
```
### Apply Generic GitHub Email
```
git config user.email "you@example.com"
```
### Apply Patch to revert changes when NDI was removed from FFMPEG
```
sudo git am ../FFMPEG-NDI/libndi.patch
sudo cp ../FFMPEG-NDI/libavdevice/libndi_newtek_* libavdevice/
```
At this point, FFMPEG is now reverted back to the way it was before NDI was removed from it.

### Install Prerequisites for building FFMPEG with base libraries
```
sudo bash ../FFMPEG-NDI/preinstall.sh
```
### Choose the appropriate NDI install for the CPU architecture

#### Install NDI Libraries on Raspberry Pi 4 64-bit
```
sudo bash ../FFMPEG-NDI/install-ndi-rpi4-aarch64.sh
```

#### Install NDI Libraries on Raspberry Pi 4 32-bit
```
sudo bash ../FFMPEG-NDI/install-ndi-rpi4-armhf.sh
```

#### Install NDI Libraries on Raspberry Pi 3 32-bit
```
sudo bash ../FFMPEG-NDI/install-ndi-rpi3-armhf.sh
```

#### Install NDI Libraries on x86_64 bit (Intel/AMD)
```
sudo bash ../FFMPEG-NDI/install-ndi-x86_64.sh
```

#### Install NDI Libraries on generic ARM64

Compiling on generic ARM64 requires use of the NDI Advanced SDK. Due to licensing restrictions, the NDI Advanced SDK must be downloaded manually from NDI's website: ndi.tv
Extract the downloaded NDI Advanced SDK .tar file and copy it to the ffmpeg directory on the target device. This can be achieved by using FTP, SCP, or Samba.
```
sudo bash ../FFMPEG-NDI/install-ndi-generic-aarch64.sh
```
#### Install NDI Libraries on generic ARM32

Compiling on generic ARM32 requires use of the NDI Advanced SDK. Due to licensing restrictions, the NDI Advanced SDK must be downloaded manually from NDI's website: ndi.tv
Extract the downloaded NDI Advanced SDK .tar file and copy it to the ffmpeg directory on the target device. This can be achieved by using FTP, SCP, or Samba.
```
sudo bash ../FFMPEG-NDI/install-ndi-generic-armhf.sh
```

## Build and Install FFMPEG
The following is the bare minimum needed for sending and receiving NDI and more options can be added for a more feature filled FFMPEG build.
```
./configure --enable-nonfree --enable-libndi_newtek
make -j $(nproc)
sudo make install
```
Installation is now complete

## Usage for FFMPEG with NDI

List all sources on the network
```
ffmpeg -f libndi_newtek -find_sources 1 -i dummy
```

Stream a webcam to NDI
```
ffmpeg -f v4l2 -framerate 30 -video_size 1280x720 -pixel_format mjpeg -i /dev/video1 -f libndi_newtek -pix_fmt uyvy422 CameraOut
```

Monitor a NDI stream
```
ffplay -fs -alwaysontop -fflags nobuffer -f libndi_newtek -bandwidth 0 -i 'NDI-SOURCE (Stream 1)'
```
Monitor a NDI stream (low latency)
```
ffplay -fs -alwaysontop -fflags nobuffer -flags low_delay -framedrop -analyzeduration 0 -max_probe_packets 1 -max_delay 0 -probesize 100000 -f libndi_newtek -bandwidth 0 -i 'NDI-SOURCE (Stream 1)'
```

The bandwidth argument can accept a few options when receiving:
- 0 = High Bandwidth
- 1 = Low Bandwidth
- 2 = Audio Only

## Helpful Tips

To view help
```
ffmpeg --help
```
To compress ffmpeg source to .tar file
```
tar -zcvf ffmpeg.tar.gz ffmpeg
```
