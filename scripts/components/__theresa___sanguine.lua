-- [[============================================================]]
local __Theresa__Sanguine = Class(function(self, inst)
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
function __Theresa__Sanguine:SetMax(max)
    self.max = max
    -- self.current = max
end

function __Theresa__Sanguine:GetMax()
    return self.max
end

-- 调整/获取 现在
function __Theresa__Sanguine:SetCurrent(current)
    self.current = current
end

function __Theresa__Sanguine:GetCurrent()
    return self.current
end

--充满
function __Theresa__Sanguine:Fill()
    self.current = self.max
end

-- [[============================================================]]
return __Theresa__Sanguine
