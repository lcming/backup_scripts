sudo apt-get install build-essential cmake python-dev -y
cd ~/.vim/bundle
git clone git://github.com/Valloric/YouCompleteMe.git
cd YouCompleteMe
git submodule update --init --recursive


mkdir ~/ycm_temp
cd ~/ycm_temp
wget http://llvm.org/releases/3.7.0/clang+llvm-3.7.0-x86_64-linux-gnu-ubuntu-14.04.tar.xz
tar -xvf clang+llvm-3.7.0-x86_64-linux-gnu-ubuntu-14.04.tar.xz
mv clang+llvm-3.7.0-x86_64-linux-gnu-ubuntu-14.04 llvm_root_dir

mkdir ~/ycm_build
cd ~/ycm_build
cmake -G "Unix Makefiles" -DPATH_TO_LLVM_ROOT=~/ycm_temp/llvm_root_dir . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
cmake --build . --target ycm_core
