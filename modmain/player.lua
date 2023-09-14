-- [[============================================================]]

-- [[============================================================]]
-- HUD
local TheresalunaSanguineBadge = require "widgets/theresaluna_sanguniebadge"

AddClassPostConstruct("widgets/statusdisplays", function(self)
    if self.owner and self.owner.prefab == "theresaluna" then
        self.theresaluna_sanguine = self:AddChild(TheresalunaSanguineBadge(self.owner))
        self.theresaluna_sanguine:SetPosition(self.column5, 20, 0)
    end

    local old_SetGhostMode = self.SetGhostMode
    function self:SetGhostMode(ghostmode, ...)
        old_SetGhostMode(self, ghostmode, ...)
        if self.theresaluna_sanguine then
            if self.isghostmode then
                self.theresaluna_sanguine:Hide()
            else
                self.theresaluna_sanguine:Show()
            end
        end
    end
end)
