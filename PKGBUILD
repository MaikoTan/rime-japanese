# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Maiko Tan <maiko.tan.coding@gmail.com>
pkgname=rime-japanese
pkgver=0.2.0.20200420
_commit=189f5e57198ff392518a901ab748beb0b44254f2
pkgrel=1
# epoch=
pkgdesc="japanese input for rime"
arch=('x86_64')
url="https://github.com/gkovacs/rime-japanese"
license=('UNLICENSED')
# groups=()
# dependency for reverse lookup: rime-terra-pinyin
# dependency: rime-stroke
depends=('rime-terra-pinyin' 'rime-stroke')
makedepends=('librime' 'rime-prelude' 'rime-essay')
# checkdepends=()
# optdepends=()
# provides=()
# conflicts=()
# replaces=()
# backup=()
# options=()
# install=
# changelog=
source=("https://github.com/gkovacs/rime-japanese/archive/$_commit/rime-japanese-$_commit.tar.gz")
# noextract=()
# md5sums=()
sha512sums=('c4cf7eb502056a24c924934b73e0fd06c83459a8dc229dca3698e722bca7685b3cf5663c7d592016ce1f043c6c0da5c465fd0dfcd9d601b141bea8d83a8995ae')
# validpgpkeys=()

prepare() {
  cd $pkgname-$_commit
  # Link essentials
  for _f in $(pacman -Qql rime-prelude rime-essay | grep -v "/$"); do ln -sf $_f; done

}

build() {
  cd $pkgname-$_commit
  for _s in $(ls *.schema.yaml); do rime_deployer --compile $_s; done
}

package() {
  cd $pkgname-$_commit
  find . -type l -delete
  install -Dm644 *.yaml -t "$pkgdir"/usr/share/rime-data/
  install -Dm644 build/* -t "$pkgdir"/usr/share/rime-data/build/
}
