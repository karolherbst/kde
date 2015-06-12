# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit kde4-base

DESCRIPTION="Extra Dolphin plugins"
KEYWORDS=""
IUSE="debug bazaar git mercurial subversion"

DEPEND="
	$(add_kdeapps_dep libkonq)
"
RDEPEND="${DEPEND}
	$(add_kdeapps_dep kompare '' '14.12.3')
	bazaar? ( dev-vcs/bzr )
	git? ( dev-vcs/git )
	mercurial? ( dev-vcs/mercurial )
	subversion? ( dev-vcs/subversion )
"

src_install() {
	{ use bazaar || use git || use mercurial || use subversion; } && kde4-base_src_install
}

pkg_postinst() {
	if ! use bazaar && ! use git && ! use mercurial && ! use subversion ; then
		einfo
		einfo "You have disabled all plugin use flags. If you want to have vcs"
		einfo "integration in dolphin, enable those of your needs."
		einfo
	fi
}