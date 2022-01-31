include $(TOPDIR)/rules.mk

PKG_NAME:=enviromon
PKG_VERSION:=0.4
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/enviromon-$(PKG_VERSION)
PKG_SOURCE:=enviromon-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://ssl.morgul.net/
PKG_HASH:=4162c1ccafb2fe999eb775ec9fec25ba80090731d6cd8bad429c30ec7e8c5f2e

include $(INCLUDE_DIR)/package.mk

ifeq ($(CONFIG_TARGET_PROFILE),DEVICE_rpi)
#  CFLAGS+= -DRASPBERRY_PI
endif
export NO_SYSTEMD=1
EXTRA_CFLAGS+=-DRASPBERRY_PI
CFLAGS+= -DRASPBERRY_PI
export EXTRA_CFLAGS CFLAGS

define Package/enviromon
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Environment sensor utilities
  URL:=https://noah.meyerhans.us/
  DEPENDS+=kmod-i2c-bcm2835
endef

define Package/enviromon/description
 Environment sensor utilities
 Read environment data (temperature, humidity, etc) from sensors and present
 them on the network.
endef

define Package/enviromon/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/tempread $(1)/usr/bin/
	$(INSTALL_BIN) files/tempread-runner.sh $(1)/usr/bin/tempread-runner
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) files/tempread.init $(1)/etc/init.d/tempread
endef

$(eval $(call BuildPackage,enviromon))
