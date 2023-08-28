local Widget = require "widgets/widget"
local Image = require "widgets/image"

local __theresa___widget_sanguinebadge_dst = Class(Widget, function(self, owner)
    Widget._ctor(self, "__theresa___widget_sanguinebadge_dst")
    self:SetScale(1, 1)


    self.img = self:AddChild(Image("images/__theresa___image_sanguinebadge_dst.xml",
        "__theresa___image_sanguinebadge_dst.tex"))
    self.img:SetScale(0.6134, 0.6134)
end)
return __theresa___widget_sanguinebadge_dst
