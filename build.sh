apk add alpine-sdk linux-headers git zlib-dev openssl-dev gperf php cmake
git clone https://github.com/tdlib/td.git
git checkout d7203eb
cd td || exit
mkdir build
cd build || exit
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr/local ..
cmake --build . --target prepare_cross_compiling
cd ..
php SplitSource.php
cd build || exit
cmake --build . --target install
cd ..
php SplitSource.php --undo