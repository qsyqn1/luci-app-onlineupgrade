
include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-onlineupgrade
PKG_VERSION:=5.1.0
PKG_RELEASE:=1

LUCI_TITLE:=OTA V5.1 Platform
# 修改 Makefile 中的依赖行
LUCI_DEPENDS:=+luci-base +curl +jsonfilter

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-onlineupgrade
 SECTION:=luci
 CATEGORY:=LuCI
 SUBMENU:=3. Applications
 TITLE:=$(LUCI_TITLE)
endef

$(eval $(call BuildPackage,luci-app-onlineupgrade))
