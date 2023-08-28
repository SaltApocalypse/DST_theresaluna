local Widget = require "widgets/widget"
local Image = require "widgets/image"

local SanguineWidget = Class(Widget, function(self, owner)
    Widget._ctor(self, "SanguineWidget")
    self:SetScale(1, 1) -- 将badge放大为三围大小的两倍

    
    self.myimage = self:AddChild(Image("images/sanguine_ui.xml", "sanguine_ui.tex"))
    self.myimage:SetScale(0.5, 0.5)
end)

return SanguineWidget
