
set -xe

git version
env | grep GIT || :

curl -L https://www.kernel.org/pub/software/scm/git/git-2.25.1.tar.xz  | tar -xJf -

INSTALL_DIR=$(pwd)/git-install
mkdir -p $INSTALL_DIR

cd git-2.25.1/

./configure --prefix=$INSTALL_DIR
make -j 10
make install
