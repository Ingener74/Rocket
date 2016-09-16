
local winSize = cc.Director:getInstance():getWinSize()

local Rocket = class("Rocket", function()
	return display.newSprite("rocket.png")
end)

function Rocket:ctor()
	self:setPosition(winSize.width/2, 300)
end

function Rocket:run()
	self:runAction(
	   cc.Sequence:create(
    	   cc.MoveBy:create(3.0,cc.p(0, 1200))
	   )
    )
end

return Rocket