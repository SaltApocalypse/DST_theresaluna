-- [[============================================================]]
local TheresaLunaSanguine = Class(function(self, inst)
    self.inst = inst
    self.max = 100
    self.current = 0
end)
--[[,
    nil,
    {
        -- current = on_current
    })
]]

-- [[============================================================]]
-- 调整/获取 上限
function TheresaLunaSanguine:SetMax(max)
    self.max = max
    -- self.current = max
end

function TheresaLunaSanguine:GetMax()
    return self.max
end

-- 调整/获取 现在
function TheresaLunaSanguine:SetCurrent(current)
    self.current = current
end

function TheresaLunaSanguine:GetCurrent()
    return self.current
end

--充满
function TheresaLunaSanguine:Fill()
    self.current = self.max
end

-- [[============================================================]]
return TheresaLunaSanguine
