
local AdminLayer = require "app.views.AdminLayer"

local AdminController = class("AdminController")

function AdminController:ctor(parent)
	self._parent = parent
	self._layer = AdminLayer:create(
		self,
		cc.c4b(0xE8, 0xB0, 0x15, 200), 
		display.width * .9, 
		display.height * .5)
end

function AdminController:parent()
	return self._parent
end

function AdminController:layer()
	return self._layer
end

return AdminController