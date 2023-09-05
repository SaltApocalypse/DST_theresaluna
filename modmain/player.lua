-- [[============================================================]]

-- [[============================================================]]
-- HUD
local __Theresa__SanguineBadge = require "widgets/__theresa___sanguniebadge"

AddClassPostConstruct("widgets/statusdisplays", function(self)
    if self.owner and self.owner.prefab == "__theresa__" then
        self.__theresa___sanguine = self:AddChild(__Theresa__SanguineBadge(self.owner))
        self.__theresa___sanguine:SetPosition(self.column5, 20, 0)
    end

    local old_SetGhostMode = self.SetGhostMode
    function self:SetGhostMode(ghostmode, ...)
        old_SetGhostMode(self, ghostmode, ...)
        if self.__theresa___sanguine then
            if self.isghostmode then
                self.__theresa___sanguine:Hide()
            else
                self.__theresa___sanguine:Show()
            end
        end
    end
end)
