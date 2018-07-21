home=/home/lcming
add-apt-repository ppa:jonathonf/vim
apt-get update
dpkg --configure -a
apt-get upgrade
sudo dpkg --configure -a
apt install vim x11-apps -y
apt install g++ gnuplot make cmake python-dev python-pip python3-pip -y
apt install default-jre default-jdk -y
git clone https://github.com/VundleVim/Vundle.vim.git $home/.vim/bundle/Vundle.vim
