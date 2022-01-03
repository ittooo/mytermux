# mytermux
termux install
安装包下载
https://f-droid.org/packages/com.termux

termux-change-repo使用此命令替换镜像源
pkg  install root-repo unstable-repo game-repo science-repo

sh -c "$(curl -fsSL https://gitee.com/ittooo/mytermux/raw/master/install.sh)"

修改问候语
vim $PREFIX/etc/motd

模拟root环境
pkg install proot -y
termux-chroot
