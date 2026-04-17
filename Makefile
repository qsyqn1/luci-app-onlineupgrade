
include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-onlineupgrade
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

LUCI_TITLE:=LuCI App Online Upgrade
LUCI_DEPENDS:=+lua +luci-base +curl

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-onlineupgrade
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=$(LUCI_TITLE)
endef

define Build/Compile
endef

define Package/luci-app-onlineupgrade/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./root/usr/bin/onlineupgrade.sh $(1)/usr/bin/

	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./root/etc/config/onlineupgrade $(1)/etc/config/
endef

$(eval $(call BuildPackage,luci-app-onlineupgrade))
