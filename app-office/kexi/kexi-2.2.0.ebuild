# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

KMNAME="koffice"
inherit kde4-meta

DESCRIPTION="KOffice integrated environment for database management."
KEYWORDS="~amd64 ~hppa ~ppc ~ppc64 ~x86"
IUSE="freetds mysql postgres reports xbase"

DEPEND="
	sys-libs/readline
	app-arch/bzip2
	~app-office/kspread-${PV}:${SLOT}
	freetds? ( dev-db/freetds )
	mysql? ( virtual/mysql )
	postgres? ( =dev-libs/libpqxx-2.6* )
	reports? ( ~app-office/kchart-${PV}:${SLOT}[reports] )
	xbase? ( dev-db/xbase )
"
RDEPEND="${DEPEND}"

KMLOADLIBS="koffice-libs"
KMEXTRACTONLY="
	libs/
	kspread/
"

src_configure() {
	 mycmakeargs=(
		-DWITH_WEBFORMS=Off
		$(cmake-utils_use_with freetds FreeTDS)
		$(cmake-utils_use_with mysql MySQL)
		$(cmake-utils_use_with postgres PostgreSQL)
		$(cmake-utils_use_with postgres Pqxx)
		$(cmake-utils_use_with xbase XBase)
		-DBUILD_kexi=ON
	)

	kde4-meta_src_configure
}
