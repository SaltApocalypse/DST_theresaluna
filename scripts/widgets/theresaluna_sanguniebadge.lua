local Badge = require "widgets/badge"
local UIAnim = require "widgets/uianim"

local COLOR = { 255 / 255, 40 / 255, 40 / 255, 1 }
-- TODO:自定义图标和颜色考虑

local TheresaLunaSanguineBadge = Class(Badge, function(self, owner)
    Badge._ctor(self, nil, owner, COLOR, "status_health", nil, nil, true)

    self.theresalunasanguinearrow = self.underNumber:AddChild(UIAnim())
    self.theresalunasanguinearrow:GetAnimState():SetBank("sanity_arrow")
    self.theresalunasanguinearrow:GetAnimState():SetBuild("sanity_arrow")
    self.theresalunasanguinearrow:GetAnimState():PlayAnimation("neutral")
    self.theresalunasanguinearrow:SetClickable(false)
    self.theresalunasanguinearrow:GetAnimState():AnimateWhilePaused(false)

    self:StartUpdating()
end)

function TheresaLunaSanguineBadge:OnUpdate(dt)
    if TheNet:IsServerPaused() then return end

    -- 根据状态转变动画
    --[[
    local anim = "neutral"
    if self.owner ~= nil and
        self.owner:HasTag("sleeping") and
        self.owner.replica.hunger ~= nil and
        self.owner.replica.hunger:GetPercent() > 0 then
        anim = "arrow_loop_decrease"
    end

    if self.owner:HasDebuff("wintersfeastbuff") or self.owner:HasDebuff("hungerregenbuff") then
        anim = "arrow_loop_increase"
    end

    if self.arrowdir ~= anim then
        self.arrowdir = anim
        self.theresalunasanguinearrow:GetAnimState():PlayAnimation(anim, true)
    end
    ]]
end

return TheresaLunaSanguineBadge
