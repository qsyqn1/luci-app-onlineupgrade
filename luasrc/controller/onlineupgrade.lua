
module("luci.controller.onlineupgrade", package.seeall)

function index()
    entry({"admin","services","onlineupgrade"}, template("onlineupgrade/index"), _("Online Upgrade"), 60)
end
