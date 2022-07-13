PORTNAME=	AliceVision
DISTVERSION=	g20220704
CATEGORIES=	multimedia
PKGNAMESUFFIX=	-dev
DISTNAME=	${PORTNAME}-${GH_TAGNAME}
DIST_SUBDIR=	${PORTNAME}${PKGNAMESUFFIX}

MAINTAINER=	nope@nothere
COMMENT=	Vision Framework for 3D Reconstruction and Camera Tracking algorithms

LICENSE=	MIT

BUILD_DEPENDS=	lzlib>=1.1:archivers/lzlib \
		lgf-gen:math/lemon \
		mconvert:math/openmesh

LIB_DEPENDS=	libassimp.so:multimedia/assimp \
		libboost_atomic.so:devel/boost-libs \
		libceres.so:math/ceres-solver \
		libgeogram.so:math/geogram \
		libOpenEXR.so:graphics/openexr \
		libOpenImageIO.so:graphics/openimageio \
		libpng.so:graphics/png \
		libtiff.so:graphics/tiff \
		libflann_cpp.so:math/flann \
		libCoinUtils.so:math/coinutils \
		libClp.so:math/clp \
		libOsi.so:math/osi

CMAKE_ARGS+=    -DALICEVISION_BUILD_DEPENDENCIES:BOOL=ON \
		-DALICEVISION_BUILD_TESTS:BOOL=OFF \
		-DAV_BUILD_CUDA:BOOL=OFF \
		-DAV_BUILD_ZLIB:BOOL=OFF \
		-DAV_BUILD_ASSIMP:BOOL=OFF \
		-DAV_BUILD_TIFF:BOOL=OFF \
		-DAV_BUILD_JPEG=OFF \
		-DAV_BUILD_PNG=OFF \
		-DAV_BUILD_LIBRAW:BOOL=OFF \
		-DAV_BUILD_CCTAG:BOOL=OFF \
		-DAV_BUILD_APRILTAG:BOOL=OFF \
		-DAV_BUILD_POPSIFT:BOOL=OFF \
		-DAV_BUILD_OPENCV:BOOL=OFF \
		-DAV_BUILD_OPENGV:BOOL=OFF \
		-DAV_BUILD_LAPACK:BOOL=OFF \
		-DAV_BUILD_PNG:BOOL=OFF \
		-DAV_BUILD_SUITESPARSE:BOOL=OFF \
		-DAV_BUILD_FFMPEG:BOOL=OFF \
		-DAV_USE_CUDA:BOOL=OFF

USES=		cmake compiler:c++11-lang eigen:3 pkgconfig:build jpeg ninja

USE_GITHUB=	nodefault
GH_ACCOUNT=	alicevision
GH_PROJECT=	AliceVision
GH_TAGNAME=	5650579ddf25769637c5c0eeced77fe43b4133c7

WRKSRC=	${WRKDIR}/${PORTNAME}-${GH_TAGNAME}

#	Linux:
#
#	sudo apt-get install libpng-dev libjpeg-dev libtiff-dev libxxf86vm1 libxxf86vm-dev libxi-dev libxrandr-dev
#
#	If you want see the view graph svg logs sudo apt-get install graphviz
#
#    Clang >= 3.3
#
#
#    Assimp >= 5.0.0
#    Boost >= 1.70.0
#    Ceres >= 1.10.0
#    Eigen >= 3.3.4
#    Geogram >= 1.7.5
#    OpenEXR >= 2.5
#    OpenImageIO >= 2.1.0
#    zlib
#
#    if you have jpeg already install on your OS, you can disable the JPEG build with -DAV_BUILD_JPEG=OFF.
#
# Recently quits expecting osi_clp/CoinUtils dependent, although it exists on the system.q
#
# 
# # ==============================================================================
# # Check that submodule have been initialized and updated     
# # ==============================================================================
# if(NOT EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/dependencies/osi_clp/CoinUtils)    
#   message(FATAL_ERROR                                                           
#       "\n submodule(s) are missing, please update your repository:\n"                
#           "  > git submodule update -i\n")                                        
#           endif()
#----
#
# AliceVision also depends on some embedded libraries:
#
#	CoinUtils >= 2.9.3 (internal)
#	Coin-or linear programming (Clp) (internal)
#	Flann >= 1.8.4 (internal)
#	Lemon >= 1.3 (internal)
# Need:	MeshSDFilter (internal)
#	OpenMesh (internal)
#	Open Solver Interface (Osi) >= 0.106.10 (internal)
#
# Other optional libraries can enable specific features (check "CMake Options" for enabling them):
#
#	Alembic (data I/O)
#	CCTag (feature extraction/matching and localization on CPU or GPU)
#	Cuda >= 7.0 (feature extraction and depth map computation)
#	Magma (required for UncertaintyTE)
#	Mosek >= 5 (linear programming)
#	OpenCV >= 3.4.11 (feature extraction, calibration module, video IO), >= 4.5 for colorchecker (mcc)
#	OpenGV (rig calibration and localization)
#	OpenMP (enable multi-threading)
#	-DALICEVISION_USE_OPENMP:BOOL=OFF
#	PopSift (feature extraction on GPU)
#	UncertaintyTE (Uncertainty computation)
#
#
# CMake Warning:
#   Manually-specified variables were not used by the project:
# 	CMAKE_CXX_FLAGS_RELEASE=
# 	CMAKE_C_FLAGS_RELEASE=
# 	CMAKE_INSTALL_RPATH_USE_LINK_PATH=
# 	CMAKE_MODULE_LINKER_FLAGS=
# 	CMAKE_SHARED_LINKER_FLAGS=
# 	CMAKE_VERBOSE_MAKEFILE=
# 	THREADS_HAVE_PTHREAD_ARG=
#
#
# From another port which solves libiconv vs iconv issue.
#CMAKE_ARGS+=    -DIconv_LIBRARIES="-L${LOCALBASE}/lib -liconv"


.include <bsd.port.mk>
