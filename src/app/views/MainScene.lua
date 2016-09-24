
local MainController = require "app.controllers.MainController"

local MainScene = class("MainScene", cc.load("mvc").ViewBase)
function MainScene:onCreate()
    dump(cc.Application:getInstance():getTargetPlatform())
    dump(cc.Application:getInstance():getCurrentLanguage())
    dump(cc.Application:getInstance():getCurrentLanguageCode())
    dump(cc.Application:getInstance():getVersion())

    cc.SpriteFrameCache:getInstance():addSpriteFrames("atlas0.plist")

    self._mainController = MainController:create()
    self:addChild(self._mainController:layer())

    self._mainController:rocketController()
    
    self:addChild(self._mainController:hudController():layer())
    
    self:addChild(self._mainController:adminController():layer())
end

return MainScene
