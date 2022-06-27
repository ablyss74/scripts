
### Building qjackctl, jack, and rakarrack on Clear Linux
```bash
# Optional method to test this is to run everything in docker.  But is not required. 
# If testing in docker: 
swupd bundle-add containers-basic && systemctl start docker.service && systemctl enable docker.service

# To test in docker copy and paste the entire line and it will load up a docker shell when done.
# Then follow the steps below inside docker terminal.
echo -e 'FROM clearlinux:latest \nRUN swupd bundle-add curl c-basic qt5-dev devpkg-jack2 devpkg-jack2 os-utils-gui-dev' > /tmp/Dockerfile && docker build -t clearlinux:latest < /tmp/Dockerfile - && modprobe snd-seq && xhost local:${USER} && docker run -it --privileged -e JACK_NO_AUDIO_RESERVATION=1  --device /dev/snd -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native -v /dev/shm:/dev/shm:rw --net=host -e DISPLAY=${DISPLAY} clearlinux:latest
```
```Bash

# Required bundles
swupd bundle-add curl c-basic qt5-dev devpkg-jack2 os-utils-gui-dev

# Build Jack
git clone https://github.com/jackaudio/jack2.git jack-git
cd jack-git
./waf configure
./waf
./waf install

# Build Qjackctl
git clone https://git.code.sf.net/p/qjackctl/code qjackctl-git
cd qjackctl-git
cmake -B build
cmake --build build
cmake --install build

# Set the system in realtime mode
echo -1 > /proc/sys/kernel/sched_rt_runtime_us
# load kernel module snd_seq for midi mapping also required for rakarrack.
modprobe snd_seq
# You might need to tell qjackctl to use /usr/local/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib/

# Run 
qjackctl

# Open qjackctl setting and set audio interface: hw:PCH or something similar, sample rate: 48khz, frames/period: 1024, midi driver: seq

# Restart qjackctl

#Buld rakarrack
git clone git://rakarrack.git.sourceforge.net/gitroot/rakarrack/rakarrack rakarrack-git
cd rakarrack-git
./autogen.sh
./configure
make
make install

# Run
rakarrack
```
