PORTNAME=	AliceVision
DISTVERSION=	g20220611
CATEGORIES=	multimedia
PKGNAMESUFFIX=	-dev
DISTNAME=	${PORTNAME}-${GH_TAGNAME}
DIST_SUBDIR=	${PORTNAME}${PKGNAMESUFFIX}

MAINTAINER=	nope@nothere
COMMENT=	Vision Framework for 3D Reconstruction and Camera Tracking algorithms

LICENSE=	MIT

BUILD_DEPENDS=	lzlib>=1.1:archivers/lzlib

LIB_DEPENDS=	libassimp.so:multimedia/assimp \
		libboost_atomic.so:devel/boost-libs \
		libceres.so:math/ceres-solver \
		libgeogram.so:math/geogram \
		libOpenEXR.so:graphics/openexr \
		libOpenImageIO.so:graphics/openimageio \

USES=		compiler:c++14-lang cmake eigen:3

USE_GITHUB=	nodefault
GH_ACCOUNT=	alicevision
GH_PROJECT=	AliceVision
GH_TAGNAME=	0372bca9895fd4574d5875a365f2a60d7283304f

WRKSRC=	${WRKDIR}/${PORTNAME}-${GH_TAGNAME}

#    Assimp >= 5.0.0
#    Boost >= 1.70.0
#    Ceres >= 1.10.0
#    Eigen >= 3.3.4
#    Geogram >= 1.7.5
#    OpenEXR >= 2.5
#    OpenImageIO >= 2.1.0
#    zlib
#
# Recently quits expecting osi_clp/CoinUtils which I don't see as required.
# Cmake options not yet investigated, possibly the CoinUtils could be avoided.

.include <bsd.port.mk>
