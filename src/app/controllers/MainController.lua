
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

return MainController