# This only installs the libs
# See  [projectm_clear_linux](./projectm_clear_linux) for binaries.


# Instructions borrowed from https://github.com/projectM-visualizer/projectm/blob/master/BUILDING.md

git clone https://github.com/projectM-visualizer/projectm.git
cd projectm
git fetch --all --tags


mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local ..

cmake --build . -- -j 
cmake --build . --target install 
