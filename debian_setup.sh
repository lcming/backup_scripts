home=/home/lcming
backup_archive=$home/Downloads/backup.zip
backup_root=./backup
tmp=./tmp
uname=lcming
# This script must be run in root
mkdir $tmp
cd $tmp

# general update
apt-get update
apt-get upgrade

# basic util
apt install vim dirmngr guake terminator

# developer
apt install g++ gnuplot make cmake python-dev -y
apt install default-jre default-jdk icedtea-plugin -y

# spotify
if ! [ -x "`command -v spotify`" ]; then
	wget http://ftp.tw.debian.org/debian/pool/main/o/openssl/libssl1.0.0_1.0.1t-1+deb8u6_amd64.deb
	apt install ./libssl1.0.0_1.0.1t-1+deb8u6_amd64.deb 
	apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 0DF731E45CE24F27EEEB1450EFDC8610341D9410
	apt install dirmngr
	apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 0DF731E45CE24F27EEEB1450EFDC8610341D9410
	echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
	apt-get update
	apt-get install spotify-client
fi

# restore backup files from archive
unzip $backup_archive -d ./
cp -rf $backup_root/* $home/
cp -rf $backup_root/.vim $home/
cp -f $backup_root/.bashrc $home/
cp -f $backup_root/.vimrc $home/

# restore backup files from git
cp ./.bashrc $home/
cp ./.vimrc $home/

# setup vim
git clone https://github.com/VundleVim/Vundle.vim.git $home/.vim/bundle/Vundle.vim

# fonts install
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
cwd=`pwd`
runuser -l  $uname -c "bash $cwd/install.sh"
mkdir $home/.config/fontconfig
cp fontconfig/50-enable-terminess-powerline.conf $home/.config/fontconfig/conf.d
runuser -l  $uname -c 'fc-cache -vf'

cd ../..
rm -rf $tmp
