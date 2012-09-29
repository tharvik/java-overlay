# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
JAVA_PKG_IUSE="doc source"

inherit vcs-snapshot java-pkg-2 java-pkg-simple

DESCRIPTION="Native JNI component for dev-java/jansi"
HOMEPAGE="http://jansi.fusesource.org/"
SRC_URI="https://github.com/fusesource/${PN}/tarball/${P} -> ${P}.tar.gz"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=virtual/jre-1.5
	dev-java/hawtjni-runtime:0"

DEPEND=">=virtual/jdk-1.5
	dev-java/hawtjni-runtime:0"

S="${WORKDIR}/${P}"
JAVA_SRC_DIR="src/main/java"
JAVA_GENTOO_CLASSPATH="hawtjni-runtime"

java_prepare() {
	# Easier to use java-pkg-simple.
	rm -v pom.xml || die
}

src_install() {
	java-pkg-simple_src_install
	dodoc {changelog,readme}.md
}
