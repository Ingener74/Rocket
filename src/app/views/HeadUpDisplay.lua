
local function clickAnimation(node, callback)
    node:runAction(
        cc.Sequence:create(
            cc.ScaleTo:create(0.05, 0.9, 0.9),
            cc.CallFunc:create(callback),
            cc.ScaleTo:create(0.05, 1.0, 1.0)
        )
    )
end

local HeadUpDisplay = class("HeadUpDisplay", function()
	return display.newLayer()
end)

function HeadUpDisplay:ctor(delegate)
	self._delegate = delegate

    self._buttonClose = ccui.Button:create("button_normal.png", "button_pressed.png", "button_pressed.png", ccui.TextureResType.plistType)
    self._buttonClose:setPosition(display.width - 36/2 - 8, display.height - 36/2 - 8)
    self._buttonClose:setTitleText("X")
    self._buttonClose:setTitleFontSize(24)
    self._buttonClose:setScale9Enabled(true)
    self._buttonClose:setCapInsets({10, 20, 10, 20})
    self._buttonClose:setContentSize(36, 36)
    self:addChild(self._buttonClose)
    self._buttonClose:addClickEventListener(function(sender)
        clickAnimation(self._buttonClose, function()
            self._delegate:onCloseButtonClick()
        end)
    end)

    self._buttonAdmin = ccui.Button:create("button_normal.png", "button_pressed.png", "button_pressed.png", ccui.TextureResType.plistType)
    self._buttonAdmin:setContentSize(120, 100)
    self._buttonAdmin:setTitleText("ADMIN")
    self._buttonAdmin:setTitleFontSize(24)
    self._buttonAdmin:setScale9Enabled(true)
    self._buttonAdmin:setCapInsets({10, 20, 10, 20})
    self:addChild(self._buttonAdmin)
    self._buttonAdmin:setPosition(
    	display.width - self._buttonAdmin:getContentSize().width/2 - 8,
    	self._buttonAdmin:getContentSize().height/2 + 8)
    self._buttonAdmin:addClickEventListener(function(sender)
        clickAnimation(self._buttonAdmin, function()
            self._delegate:onAdminButtonClick()
        end)
    end)
end

return HeadUpDisplay