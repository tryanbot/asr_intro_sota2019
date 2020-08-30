sudo apt-get install openmpi-bin openmpi-common libopenmpi-dev libasound2-dev libflac-dev     libogg-dev     libtool     libvorbis-dev     libfftw3-dev     zlib1g-dev     libbz2-dev     liblzma-dev     libboost-all-dev     libgflags-dev     libgflags2.2    libgoogle-glog-dev     libgoogle-glog0v5  libsndfile1-dev libsndfile1-dev libopenblas-dev libfftw3-dev libgflags-dev libgoogle-glog-dev liblzma-dev libbz2-dev libzstd-dev
sudo apt-get install    

#install arrayfire
wget https://arrayfire.s3.amazonaws.com/3.7.2/ArrayFire-v3.7.2_Linux_x86_64.sh
./ArrayFire-v3.7.2_Linux_x86_64.sh  --include-subdir --prefix=/opt

git clone https://github.com/facebookresearch/flashlight.git
cd flashlight
git checkout v0.2
mkdir build
cd build
ArrayFire_DIR=/home/user/erw/arrayfire/share/ArrayFire/cmake  cmake .. -DCMAKE_BUILD_TYPE=Release -DCUDA_TOOLKIT_ROOT_DIR=/opt/nvidia/cuda/10.0 -DFL_BACKEND=CUDA  -DFL_BUILD_DISTRIBUTED=ON -DFL_BUILD_CONTRIB=OFF -DFL_BUILD_TESTS=ON -DFL_BUILD_EXAMPLES=ON -DFL_LIBRARIES_USE_MKL=OFF -DCMAKE_INCLUDE_PATH=/home/user/erw/kenlm -DKENLM_LIB=/home/user/erw/kenlm -DKENLM_UTIL_LIB=/home/user/erw/kenlm/util -DKENLM_INC=/home/user/erw/kenlm/lm
cmake .. -DCMAKE_BUILD_TYPE=Release -DFL_BACKEND=CUDA
make -j20


git clone https://github.com/kpu/kenlm.git
cd kenlm
mkdir -p build  
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DKENLM_MAX_ORDER=20
export KENLM_ROOT_DIR=`pwd`
export KENLM_LIB=${KENLM_ROOT_DIR}/lib
cd ../.. # keluar dari folder kenlm


git clone --recursive https://github.com/facebookresearch/wav2letter.git
cd wav2letter
git checkout v0.2


