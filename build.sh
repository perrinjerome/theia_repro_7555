# show what we use
echo "We are using:"
git version
echo GIT_EXEC_PATH= $GIT_EXEC_PATH
sleep 1

INSTALL_DIR=/tmp/git-install
mkdir -p $INSTALL_DIR

(
    # build another git version
    cd /tmp
    curl -L https://www.kernel.org/pub/software/scm/git/git-2.24.0.tar.xz  | tar -xJf -
    cd git-2.24.0/
    ./configure --prefix=$INSTALL_DIR
    make -j 10
    make install
) > build.log 2>&1

# use the git we just build
cd /tmp
$INSTALL_DIR/bin/git clone --recursive https://github.com/eclipse-theia/theia
echo "... this did not work, because of the incompatible GIT_EXEC_PATH"
echo

echo "if we unset GIT_EXEC_PATH, then no problem:"
rm -rf theia
GIT_EXEC_PATH= $INSTALL_DIR/bin/git clone --recursive https://github.com/eclipse-theia/theia
