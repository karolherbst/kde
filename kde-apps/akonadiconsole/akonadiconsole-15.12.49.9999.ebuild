# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

KDE_HANDBOOK="false"
KDE_PUNT_BOGUS_DEPS="true"
KMNAME="kdepim"
inherit kde5

DESCRIPTION="Akonadi developer console"
HOMEPAGE="https://www.kde.org/"
KEYWORDS=""

IUSE=""

DEPEND="
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep kdelibs4support)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kitemmodels)
	$(add_frameworks_dep kitemviews)
	$(add_frameworks_dep ktextwidgets)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
	$(add_kdeapps_dep akonadi)
	$(add_kdeapps_dep akonadi-contact)
	$(add_kdeapps_dep calendarsupport)
	$(add_kdeapps_dep kcalcore)
	$(add_kdeapps_dep kcontacts)
	$(add_kdeapps_dep kmime)
	$(add_kdeapps_dep kpimtextedit)
	$(add_kdeapps_dep libakonadi)
	$(add_kdeapps_dep libkdepim)
	$(add_kdeapps_dep messageviewer)
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtwidgets)
	dev-libs/libxslt
"
RDEPEND="${DEPEND}
	!<kde-apps/kdepim-15.12.2:5
"

if [[ ${KDE_BUILD_TYPE} = live ]] ; then
	S="${WORKDIR}/${P}"
else
	S="${WORKDIR}/${KMNAME}-${PV}"
fi

src_prepare() {
	kde5_src_prepare

	# necessary for 15.12 branch aka split-in-adv-of-upstream
	sed -e '/^include.*kleopatra\/ConfigureChecks/ s/^/#DONT/' \
		-i CMakeLists.txt || die
}

src_configure() {
	local mycmakeargs=(
		-DKDEPIM_BUILD_WITH_INSTALLED_LIB=TRUE
		-DCMAKE_DISABLE_FIND_PACKAGE_KF5GAPI=ON
		-DCMAKE_DISABLE_FIND_PACKAGE_KF5Prison=ON
		-DCMAKE_DISABLE_FIND_PACKAGE_Qt5Designer=ON
		-DCMAKE_DISABLE_FIND_PACKAGE_Qt5X11Extras=ON
	)

	kde5_src_configure
}
