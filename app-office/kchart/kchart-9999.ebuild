# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

#
# Please note that koffice is currently bumped "forward" and that this live
# ebuild is more or less unmaintained.
#

EAPI="3"

KMNAME="koffice"
KMMODULE="${PN}"
inherit kde4-meta

DESCRIPTION="KOffice chart application."

KEYWORDS=""
IUSE="reports"

KMEXTRACTONLY="
	libs/
	interfaces/
	filters/
	plugins/
"
KMEXTRA="
	filters/${KMMODULE}/
	libs/koreport/
"

KMLOADLIBS="koffice-libs"

src_configure() {
	 mycmakeargs=(
		-DBUILD_kchart=ON
		$(cmake-utils_use_build reports koreport)
	)

	kde4-meta_src_configure
}
