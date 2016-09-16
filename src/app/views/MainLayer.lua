
local winSize = cc.Director:getInstance():getWinSize()

local function clickAnimation( node, callback )
    node:runAction(
        cc.Sequence:create(
            cc.ScaleTo:create(0.05, 0.9, 0.9),
            cc.CallFunc:create(callback),
            cc.ScaleTo:create(0.05, 1.0, 1.0)
        )
    )
end

local MainLayer = class("MainLayer", cc.Layer)
function MainLayer:ctor(delegate)
    self._delegate = delegate

    local data = json.decode(cc.FileUtils:getInstance():getStringFromFile("data/data.json"))

    dump(data)
    printInfo("data: level %d, fuel %d", data.level, data.fuel)

    self._bg = display.newSprite(string.format("bg%d.png", data.level))
    self:addChild(self._bg)
    self._bg:setScale(2)
    self._bg:setPosition(winSize.width/2, winSize.height/2)

    self._buttonClose = ccui.Button:create("button.png", "buttonHighlighted.png", "buttonHighlighted.png")
    self._buttonClose:setPosition(winSize.width - 36/2 - 8, winSize.height - 36/2 - 8)
    self._buttonClose:setTitleText("X")
    self._buttonClose:setTitleFontSize(24)
    self._buttonClose:setScale9Enabled(true)
    self._buttonClose:setCapInsets({10, 20, 10, 20})
    self._buttonClose:setContentSize(36, 36)
    self:addChild(self._buttonClose)
    self._buttonClose:addClickEventListener(function(sender)
        clickAnimation(self._buttonClose, function()
            cc.Director:getInstance():endToLua()
        end)
    end)

    self._buttonStart = ccui.Button:create("animationbuttonnormal.png", "animationbuttonpressed.png")
    self._buttonStart:setPosition(winSize.width/2, 50)
    self._buttonStart:setTitleText("Start")
    self._buttonStart:setTitleFontSize(24)
    self._buttonStart:setScale9Enabled(true)
    self._buttonStart:setCapInsets({10, 20, 10, 20})
    self._buttonStart:setContentSize(200, 80)
    self:addChild(self._buttonStart)
    self._buttonStart:addClickEventListener(function(sender)
        clickAnimation(self._buttonStart, function()
            self._delegate:rocketController():runRocket()
            self:explode()
        end)
    end)

    cc.SpriteFrameCache:getInstance():addSpriteFrames("expl.plist")
end

function MainLayer:explode()
    local rocket = self._delegate:rocketController():rocket()

    self._explosion = cc.Sprite:create()
    self:addChild(self._explosion)
    self._explosion:setPosition(rocket:getPositionX(), rocket:getPositionY() - 40)

    local frames = display.newFrames("explosion_1%04d.png", 1, 90)
    local animation = display.newAnimation(frames, 3/90)
    self._explosion:playAnimationOnce(animation, {
        ["onComplete"] = function() self._explosion:removeSelf() 
        end 
    })
end

return MainLayer
