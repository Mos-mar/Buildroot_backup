################################################################################
#
# libminiupnpc
#
################################################################################

LIBMINIUPNPC_VERSION = 2.2.5
LIBMINIUPNPC_SOURCE = miniupnpc-$(LIBMINIUPNPC_VERSION).tar.gz
LIBMINIUPNPC_SITE = http://miniupnp.free.fr/files
LIBMINIUPNPC_INSTALL_STAGING = YES
LIBMINIUPNPC_LICENSE = BSD-3-Clause
LIBMINIUPNPC_LICENSE_FILES = LICENSE
LIBMINIUPNPC_CPE_ID_VENDOR = miniupnp_project
LIBMINIUPNPC_CPE_ID_PRODUCT = miniupnpc
LIBMINIUPNPC_CONF_OPTS = -DUPNPC_BUILD_SAMPLE=OFF -DUPNPC_BUILD_TESTS=OFF

ifeq ($(BR2_STATIC_LIBS),y)
LIBMINIUPNPC_CONF_OPTS += -DUPNPC_BUILD_SHARED=OFF -DUPNPC_BUILD_STATIC=ON
else ifeq ($(BR2_SHARED_LIBS),y)
LIBMINIUPNPC_CONF_OPTS += -DUPNPC_BUILD_SHARED=ON -DUPNPC_BUILD_STATIC=OFF
else
LIBMINIUPNPC_CONF_OPTS += -DUPNPC_BUILD_SHARED=ON -DUPNPC_BUILD_STATIC=ON
endif

$(eval $(cmake-package))
