
set -e

git version
env | grep GIT || :


cd /tmp
INSTALL_DIR=$(pwd)/git-install
mkdir -p $INSTALL_DIR

curl -L https://www.kernel.org/pub/software/scm/git/git-2.26.0.tar.xz  | tar -xJf -
cd git-2.26.0/

./configure --prefix=$INSTALL_DIR
make -j 10
make install

cd /tmp
$INSTALL_DIR/bin/git clone --recursive https://github.com/eclipse-theia/theia
