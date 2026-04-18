include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-onlineupgrade
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

# 必须包含这个，它会自动处理 LuCI 插件的安装路径
include $(INCLUDE_DIR)/package.mk

define Package/luci-app-onlineupgrade
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=LuCI support for Online Upgrade
  DEPENDS:=+luci-base +curl +jsonfilter
  PKGARCH:=all
endef

define Package/luci-app-onlineupgrade/description
	LuCI support for Online Upgrade.
endef

# 这是最关键的部分：定义如何安装文件到镜像
# 如果你的文件在项目根目录的 root/ 目录下，使用以下标准写法：
define Package/luci-app-onlineupgrade/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci
	$(CP) ./luasrc/* $(1)/usr/lib/lua/luci/
	
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./root/etc/init.d/* $(1)/etc/init.d/
	
	$(INSTALL_DIR) $(1)/etc/config
	$(CP) ./root/etc/config/* $(1)/etc/config/
endef

# 如果你使用的是 LuCI 的标准构建系统（luci.mk），
# 则直接在 Makefile 末尾包含以下内容，它会自动处理安装：
# include $(TOPDIR)/feeds/luci/luci.mk

# 如果没用 luci.mk，最后必须调用这个宏
$(eval $(call BuildPackage,luci-app-onlineupgrade))
