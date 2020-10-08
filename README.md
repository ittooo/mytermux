# mytermux
termux install
安装包下载
https://f-droid.org/packages/com.termux
替换源
https://mirrors.tuna.tsinghua.edu.cn/help/termux/

sh -c "$(curl -fsSL https://github.com/ittooo/mytermux/raw/master/install.sh)"

vim pulginstall

修改问候语
vim $PREFIX/etc/motd

模拟root环境
pkg install proot -y
termux-chroot