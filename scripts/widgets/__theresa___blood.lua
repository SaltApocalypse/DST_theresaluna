local Widget = require "widgets/widget"
local Image = require "widgets/image"

local __theresa___blood = Class(Widget, function(self, owner)
    Widget._ctor(self, "__theresa___blood")
    self:SetScale(1, 1)

    self.myimage = self:AddChild(Image("images/widget___theresa___blood_ui.xml", "widget___theresa___blood_ui.tex"))
    self.myimage:SetScale(1, 1)
end)

return __theresa___blood
