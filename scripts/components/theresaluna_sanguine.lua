-- [[============================================================]]
local TheresalunaSanguine = Class(function(self, inst)
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
function TheresalunaSanguine:SetMax(max)
    self.max = max
    -- self.current = max
end

function TheresalunaSanguine:GetMax()
    return self.max
end

-- 调整/获取 现在
function TheresalunaSanguine:SetCurrent(current)
    self.current = current
end

function TheresalunaSanguine:GetCurrent()
    return self.current
end

--充满
function TheresalunaSanguine:Fill()
    self.current = self.max
end

-- [[============================================================]]
return TheresalunaSanguine
