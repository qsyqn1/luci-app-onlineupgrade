include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-onlineupgrade
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-onlineupgrade
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=LuCI support for Online Upgrade
  DEPENDS:=+luci-base +curl +jsonfilter
  PKGARCH:=all
endef

# 【关键修复 1】告诉 SDK 不需要进行编译操作
define Build/Prepare
endef

define Build/Compile
endef

# 【关键修复 2】定义安装逻辑
# 请确保你的源码目录里有对应的文件夹
define Package/luci-app-onlineupgrade/install
	# 创建目标目录
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci
	# 拷贝 luasrc 下的所有内容（如果有）
	[ -d ./luasrc ] && $(CP) ./luasrc/* $(1)/usr/lib/lua/luci/ || true

	# 拷贝 root 下的所有内容到系统根目录
	[ -d ./root ] && $(CP) ./root/* $(1)/ || true
	
	# 如果有脚本需要执行权限
	[ -f $(1)/etc/init.d/onlineupgrade ] && chmod 755 $(1)/etc/init.d/onlineupgrade || true
endef

$(eval $(call BuildPackage,luci-app-onlineupgrade))
