
local Rocket = require "app.views.Rocket"

local RocketController = class("RocketController")

function RocketController:ctor(parent)
	self._parent = parent

	self._rocket = Rocket:create()
	self._parent:layer():addChild(self._rocket)
end

function RocketController:rocket()
	return self._rocket
end

function RocketController:runRocket()
	self._rocket:run()
end

return RocketController