
local AdminController = require "app.controllers.AdminController"
local HeadUpDisplayController = require "app.controllers.HeadUpDisplayController"
local RocketController = require "app.controllers.RocketController"

local MainLayer = require "app.views.MainLayer"

local MainController = class("MainController")

function MainController:ctor()
	self._layer = MainLayer:create(self)
end

function MainController:layer()
	return self._layer
end

function MainController:rocketController()
	if not self._rocketController then
		self._rocketController = RocketController:create(self)
	end
	return self._rocketController
end

function MainController:adminController()
	if not self._adminController then
		self._adminController = AdminController:create(self)
	end
	return self._adminController
end

function MainController:hudController()
	if not self._hudController then
		self._hudController = HeadUpDisplayController:create(self)
	end
	return self._hudController
end

return MainController