```bash
#!/bin/bash
# Clear Linux Build Example for Looking Glass https://looking-glass.io/

swupd bundle-add devpkg-gegl devpkg-libXfont2 kvm-host-dev devpkg-nettle desktop-dev 

export CMAKE_LIBRARY_PATH=$CMAKE_LIBRARY_PATH:/opt/nvidia/lib/
mkdir client/build
cd client/build
cmake ../
make
make install
sudo chown ${USER}:qemu /usr/local/bin/looking-glass-client
sudo chmod 660 /dev/shm/looking-glass

# Run
VM="The name of the VM in virt-manager"
looking-glass $VM
```
