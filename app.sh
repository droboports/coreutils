### COREUTILS ###
_build_coreutils() {
local VERSION="8.23"
local FOLDER="coreutils-${VERSION}"
local FILE="${FOLDER}.tar.xz"
local URL="http://ftp.gnu.org/gnu/coreutils/${FILE}"

_download_xz "${FILE}" "${URL}" "${FOLDER}"
cp src/coreutils-8.23-noman-1.patch "target/${FOLDER}/"
pushd "target/${FOLDER}"
patch -Np1 -i coreutils-8.23-noman-1.patch
./configure --host="${HOST}" --prefix="${DEST}" --enable-install-program=hostname --mandir="${DEST}/man" fu_cv_sys_stat_statfs2_bsize=yes gl_cv_func_working_mkstemp=yes
make
make install
popd
}

_build() {
  _build_coreutils
  _package
}
