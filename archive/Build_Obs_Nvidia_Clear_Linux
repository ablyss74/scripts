#!/bin/bash
# Building obs with nvenc (Nvidia encode/decode) support and also jack support on Clear Linux

# This will build a portable version of obs. Portable means "Use a portable directory structure to run OBS". Also -VLC supprot is off as it doesn't build yet on my Clear Linux system.


# 1. Build https://github.com/marioroy/ffmpeg-on-clear-linux

# 2. Proceed to build obs
sudo bash

# Required bundles
swupd bundle-add c-extras-gcc11 curl c-basic ccache devpkg-LuaJIT devpkg-jansson devpkg-libxkbcommon devpkg-curl devpkg-jack2 devpkg-pciutils devpkg-jack2 machine-learning-basic os-utils-gui-dev qt5-dev R-extras 

# Clone the repo
git clone --recursive https://github.com/obsproject/obs-studio.git

# Enter obs-studio directory
cd obs-studio

# Build the obs dependencies
bash ./obs-studio/CL/linux/01_install_dependencies.sh

# Download the latest mbedtls @ https://github.com/Mbed-TLS/mbedtls/releases
# If make fails with warning being treated as errors edit CmakeLists.txt and remove -Werror flag from "set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Werror")"
cmake -DUSE_SHARED_MBEDTLS_LIBRARY=On
make -j4
make install

export CMAKE_LIBRARY_PATH=$CMAKE_LIBRARY_PATH:/opt/nvidia/lib/:/usr/local/lib/

cmake -S . -B YOUR_BUILD_DIRECTORY -G Ninja -DCEF_ROOT_DIR="../obs-build-dependencies/cef_binary_4638_linux64" -DLINUX_PORTABLE=ON -DENABLE_PIPEWIRE=OFF -DENABLE_AJA=0 -DENABLE_JACK=ON -DENABLE_HEVC=ON -DENABLE_VLC=OFF

cmake --build YOUR_BUILD_DIRECTORY

cmake --install YOUR_BUILD_DIRECTORY

cd obs-studio/YOUR_BUILD_DIRECTORY/install/bin/64bit/

./obs &

# Some Minor Issues
# 1. RTCP connect error: Seems to only happen on 1st try. 2d try connects

# obs might give error that NVENC failed... then try this..
# 1. Create a mp4 recording WITHOUT NVENC turned on but use the standard libx264 driver
# 2. /usr/local/bin/ffmpeg -y -i <file>.mp4 -vcodec h264_nvenc -b:v 5M -acodec copy test.mp4
# 3. Then reset obs to use NVENC and try again.  

