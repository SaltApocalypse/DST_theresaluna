-- [[============================================================]]
local cfg_friendlybats = GetModConfigData("cfg_friendlybats")
-- [[============================================================]]
-- theresaluna_sanguniebadge 血印槽 显示
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

-- [[============================================================]]
-- 被动能力 - 蝙蝠类(bat/molobat)友善
if cfg_friendlybats == "cfg_friendlybats_on" then
    -- NOTE:以下代码会对修改游戏内蝙蝠(bat)的攻击逻辑，可能存在冲突隐患
    AddPrefabPostInit("bat", function(inst)
        if not GLOBAL.TheWorld.ismastersim then
            return
        end

        --[[ bat.lua -> MakeTeam ]]
        local function MakeTeam(inst, attacker)
            local leader = SpawnPrefab("teamleader")
            leader.components.teamleader:SetUp(attacker, inst)
            leader.components.teamleader:BroadcastDistress(inst)
        end

        -- 重写寻敌函数 Retarget_New
        local function Retarget_New(inst)
            local ta = inst.components.teamattacker

            local newtarget = FindEntity(inst, TUNING.BAT_TARGET_DIST, function(guy)
                    return inst.components.combat:CanTarget(guy)
                end,
                nil,
                RETARGET_CANT_TAGS,
                RETARGET_ONEOF_TAGS
            )

            -- 在一开始寻敌的时候你就别给我找到不就没事了？
            if newtarget and newtarget:HasTag("theresaluna") then -- 检查目标是否含有 theresaluna 标签
                if self_defense then                              -- 可以不打你，只要你别手贱主动打
                    return nil                                    -- 有就别打了求求了都是自己人能不能别打了
                end
            end

            if newtarget and not ta.inteam and not ta:SearchForTeam() then
                MakeTeam(inst, newtarget)
            end

            if ta.inteam and not ta.teamleader:CanAttack() then
                return newtarget
            end
        end

        -- 重新调用 SetRetargetFunction 函数
        inst.components.combat:SetRetargetFunction(3, Retarget_New)

        -- 重写酸雨相关的判定并调用
        local function OnIsAcidRaining_New(inst, isacidraining)
            if isacidraining then
                inst.components.combat:SetRetargetFunction(1, Retarget_New)
            else
                inst.components.combat:SetRetargetFunction(3, Retarget_New)
            end
        end

        -- 重新调用 OnIsAcidRaining_New 函数
        inst.OnIsAcidRaining = OnIsAcidRaining_New
    end)

    -- NOTE:以下代码会对修改游戏内裸鼹蝠(molebat)的攻击逻辑，可能存在冲突隐患
    AddPrefabPostInit("molobat", function(inst)
        -- 重写寻敌函数 Retarget_New

        local function Retarget_New(inst)
            local closest_bug = nil
            local closest_other = nil

            local mx, my, mz = inst.Transform:GetWorldPosition()

            local entities_in_range = TheSim:FindEntities(
                mx, my, mz,
                TUNING.MOLEBAT_TARGET_DIST,
                RETARGET_MUST_TAGS,
                RETARGET_CANT_TAGS,
                RETARGET_ONEOF_TAGS
            )

            for i, e in ipairs(entities_in_range) do
                if e ~= inst and e.entity:IsVisible() and inst.components.combat:CanTarget(e) then
                    if closest_bug == nil and e:HasTag("insect") then
                        closest_bug = e
                    elseif closest_other == nil then
                        closest_other = e
                    end

                    if closest_bug ~= nil and closest_other ~= nil then
                        break
                    end
                end
            end

            return (closest_bug and not closest_bug:HasTag("theresaluna"))
                or (closest_other and not closest_other:HasTag("theresaluna"))
                or nil
        end

        -- 重新调用 SetRetargetFunction 函数
        inst.components.combat:SetRetargetFunction(3, Retarget_New)
    end)
end
