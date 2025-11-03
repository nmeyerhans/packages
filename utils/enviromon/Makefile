include $(TOPDIR)/rules.mk

PKG_NAME:=enviromon
PKG_VERSION:=0.4.4
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/enviromon-$(PKG_VERSION)
PKG_SOURCE:=enviromon-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://ssl.morgul.net/
PKG_HASH:=08e81f4c43dcdfb08cd64ec4e089161b5d218343437a1c636d2d10ef8c029873

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

define Build/Compile
	$(call Build/Compile/Default,tempread)
endef

$(eval $(call BuildPackage,enviromon))
