# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

CPPUNIT_REQUIRED="optional"
inherit kde4-base

DESCRIPTION="Common library for KDE PIM apps."
HOMEPAGE="http://www.kde.org/"

KEYWORDS="~amd64 ~x86"
IUSE="debug ldap +sasl"
LICENSE="LGPL-2.1"
RESTRICT="test"

DEPEND="
	>=app-crypt/gpgme-1.1.6
	>=app-office/akonadi-server-1.1
	dev-libs/boost
	dev-libs/libgpg-error
	>=dev-libs/libical-0.42
	ldap? ( net-nds/openldap )
	sasl? ( dev-libs/cyrus-sasl )
"
# @since 4.3 - libkholidays is in kdepimlibs now
RDEPEND="${DEPEND}
	!kdeprefix? (
		!kde-base/akonadi:4.1
		!kde-base/libkholidays:4.1
		!kde-base/libkholidays:4.2
	)
"

src_configure() {
	mycmakeargs="${mycmakeargs}
		$(cmake-utils_use_with ldap Ldap)
		$(cmake-utils_use_with sasl Sasl2)"

	kde4-base_src_configure
}
