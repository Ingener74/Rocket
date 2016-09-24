
local HeadUpDisplay = require "app.views.HeadUpDisplay"

local HeadUpDisplayController = class("HeadUpDisplayController")

function HeadUpDisplayController:ctor(parent)
	self._parent = parent
	self._layer = HeadUpDisplay:create(self)
end

function HeadUpDisplayController:parent()
	return self._parent
end

function HeadUpDisplayController:layer()
	return self._layer
end

function HeadUpDisplayController:onCloseButtonClick()
	cc.Director:getInstance():endToLua()
end

function HeadUpDisplayController:onAdminButtonClick()
	self._parent:adminController():layer():toogleAdmin()
end

return HeadUpDisplayController