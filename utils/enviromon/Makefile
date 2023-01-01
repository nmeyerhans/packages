include $(TOPDIR)/rules.mk

PKG_NAME:=enviromon
PKG_VERSION:=0.4.1
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/enviromon-$(PKG_VERSION)
PKG_SOURCE:=enviromon-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://ssl.morgul.net/
PKG_HASH:=1175955597da81405df09cd9cd8cf407a92b2dd4e9c6475994f7ad396c9e1869

include $(INCLUDE_DIR)/package.mk

export NO_SYSTEMD=1

define Package/enviromon
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Environment sensor utilities
  URL:=https://noah.meyerhans.us/
ifeq ($(CONFIG_TARGET_PROFILE),DEVICE_rpi)
  DEPENDS+=kmod-i2c-bcm2835
  EXTRA_CFLAGS+=-DRASPBERRY_PI
  CFLAGS+= -DRASPBERRY_PI
  export EXTRA_CFLAGS CFLAGS
endif
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
