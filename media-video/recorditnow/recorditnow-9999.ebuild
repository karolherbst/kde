# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

#KDE_LINGUAS="en cs de hu pt_BR fr"
# need patch to work select linguas

KDE_SCM="git"
inherit kde4-base

DESCRIPTION="RecordItNow is a plugin based desktop recorder for KDE"
HOMEPAGE="http://kde-apps.org/content/show.php/RecordItNow?content=114610"
SRC_URI=""
EGIT_REPO_URI="git://gitorious.org/recorditnow/recorditnow.git"

LICENSE="GPL-2"
KEYWORDS=""
SLOT="4"
IUSE="debug ffmpeg mplayer"

# Silly upstream has no clue about runtime and buildtime deps...
CDEPEND="
	x11-libs/libXfixes
	ffmpeg? ( virtual/ffmpeg )
	mplayer? ( media-video/mplayer )
"
DEPEND="${CDEPEND}
	x11-proto/fixesproto
"
RDEPEND="${CDEPEND}
	media-video/recordmydesktop
"

src_configure() {
	mycmakeargs=(
		$(cmake-utils_use_with mplayer Mencoder)
		$(cmake-utils_use_with ffmpeg)
	)
	kde4-base_src_configure
}
