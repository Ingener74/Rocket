
local MainController = require "app.controllers.MainController"

local MainScene = class("MainScene", cc.load("mvc").ViewBase)
function MainScene:onCreate()
    dump(cc.Application:getInstance():getTargetPlatform())
    dump(cc.Application:getInstance():getCurrentLanguage())
    dump(cc.Application:getInstance():getCurrentLanguageCode())
    dump(cc.Application:getInstance():getVersion())

    self._mainController = MainController:create()
    self:addChild(self._mainController:layer())

    self._mainController:rocketController()
end

return MainScene
