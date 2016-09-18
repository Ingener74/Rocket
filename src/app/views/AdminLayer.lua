
local DURATIONS = 0.4

local function clickAnimation(node, callback)
    node:runAction(
        cc.Sequence:create(
            cc.ScaleTo:create(0.05, 0.9, 0.9),
            cc.CallFunc:create(callback),
            cc.ScaleTo:create(0.05, 1.0, 1.0)
        )
    )
end

local AdminLayer = class("AdminLayer", function(...)
	local params = {...}
	return cc.LayerColor:create(params[2], params[3], params[4])
end)

function AdminLayer:ctor(...)
	local params = {...}
	self._delegate = params[1]
	self._showed = false

	self._buttons = {}

	self:addButton("Reset rocket", function()
		self._delegate:parent():rocketController():resetRocket()
	end)
	self:addButton("Test 2", function()
		printInfo("Test 2 admin button") 
	end)
	self:addButton("Test 3", function()
		printInfo("Test 3 admin button") 
	end)

	self:addButton("Test 4", function()
		printInfo("Test 4 admin button") 
	end)
	self:addButton("Test 5", function()
		printInfo("Test 5 admin button") 
	end)
	self:addButton("Test 6", function()
		printInfo("Test 6 admin button") 
	end)

	self:addButton("Test 7", function()
		printInfo("Test 7 admin button") 
	end)
	self:addButton("Test 8", function()
		printInfo("Test 8 admin button") 
	end)

	self:enableNodeEvents()
end

function AdminLayer:onEnter()
	self:setIgnoreAnchorPointForPosition(false)
	self:setAnchorPoint(0.5, 1)
	self:setPosition(display.width/2, 0)
end

function AdminLayer:addButton(title, callback)
	local buttonWidth = (self:getContentSize().width - 8*4)/3
	local buttonHeight = 48

	local posX = math.floor(#self._buttons % 3)
	local posY = math.floor(#self._buttons / 3)

    local button = ccui.Button:create("button.png", "buttonHighlighted.png", "buttonHighlighted.png")
    button:setAnchorPoint(.5, .5)
    button:setPosition(
    	(posX*8) + buttonWidth*posX + buttonWidth/2 + 8,
    	self:getContentSize().height - (
    		(posY*8) + buttonHeight*posY + buttonHeight/2 + 8
		))
    button:setTitleText(title)
    button:setTitleFontSize(24)
    button:setScale9Enabled(true)
    button:setCapInsets({10, 10, 10, 10})
    button:setContentSize(buttonWidth , buttonHeight)
    self:addChild(button)
    button:addClickEventListener(function(sender)
        clickAnimation(button, function()
            if callback then
            	callback()
            end
        end)
    end)

    table.insert(self._buttons, button)
end

function AdminLayer:isShowed()
	return self._showed
end

function AdminLayer:showAdmin(callback)
	if not self._showed then
		self._showed = true
		self:runAction(
			cc.Sequence:create(
				cc.EaseBounceOut:create(cc.MoveTo:create(DURATIONS, cc.p(display.width/2, self:getContentSize().height))),
				cc.CallFunc:create(function()
					if callback then
						callback()
					end
				end)
			)
		)
	end
end

function AdminLayer:hideAdmin(callback)
	if self._showed then
		self._showed = false
		self:runAction(
			cc.Sequence:create(
				cc.EaseBounceOut:create(cc.MoveTo:create(DURATIONS, cc.p(display.width/2, 0))),
				cc.CallFunc:create(function()
					if callback then
						callback()
					end
				end)
			)
		)
	end
end

return AdminLayer