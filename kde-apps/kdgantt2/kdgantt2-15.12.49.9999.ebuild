# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

KDE_DOXYGEN="true"
KDE_TEST="false"
KMNAME="kdepim"
inherit kde5

DESCRIPTION="KDGantt library"
LICENSE="LGPL-2+"
KEYWORDS=""
IUSE=""

COMMON_DEPEND="
	$(add_qt_dep qtgui)
	$(add_qt_dep qtprintsupport)
	$(add_qt_dep qtwidgets)
"
DEPEND="${COMMON_DEPEND}
	sys-devel/gettext
"
RDEPEND="${COMMON_DEPEND}
	!<kde-apps/kdepim-15.08.50:5
	!kde-apps/kdepim-common-libs:4
"

if [[ ${KDE_BUILD_TYPE} = live ]] ; then
	S="${WORKDIR}/${P}/${PN}"
else
	S="${WORKDIR}/${KMNAME}-${PV}/${PN}"
fi
