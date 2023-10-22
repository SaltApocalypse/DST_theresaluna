-- [[============================================================]]
-- 引入
local MakePlayerCharacter = require "prefabs/player_common"
local assets = { Asset("SCRIPT", "scripts/prefabs/player_common.lua") }
-- 设置
local cfg_light = TUNING.THERESALUNA_cfg_light
local cfg_burden = TUNING.THERESALUNA_cfg_burden
local cfg_friendlybats = TUNING.THERESALUNA_cfg_friendlybats
local cfg_debug = TUNING.THERESALUNA_cfg_debug

-- [[============================================================]]
--[[初始物品]]
TUNING.GAMEMODE_STARTING_ITEMS.DEFAULT.THERESALUNA = {
    "grass_umbrella"
}

local start_inv = {}
for k, v in pairs(TUNING.GAMEMODE_STARTING_ITEMS) do
    start_inv[string.lower(k)] = v.THERESALUNA
end

local prefabs = FlattenTree(start_inv, true)

-- [[============================================================]]
-- 死亡/复活事件回调
local function onbecamehuman(inst)
    inst.components.locomotor:SetExternalSpeedMultiplier(inst, "theresaluna_speed_mod", 1)
end

local function onbecameghost(inst)
    inst.components.locomotor:RemoveExternalSpeedMultiplier(inst, "theresaluna_speed_mod")
end

local function onload(inst)
    inst:ListenForEvent("ms_respawnedfromghost", onbecamehuman)
    inst:ListenForEvent("ms_becameghost", onbecameghost)

    if inst:HasTag("playerghost") then
        onbecameghost(inst)
    else
        onbecamehuman(inst)
    end
end

-- [[============================================================]]
--[[被动技能：夜间光环 -> cfg_light]]
local function light_aura(inst, data)
    if cfg_light == "cfg_light_off" or (not TheWorld.state.isnight) then
        inst.Light:Enable(false)
        inst.Light:SetRadius(0)
    elseif cfg_light == "cfg_light_on" and TheWorld.state.isnight then
        inst.Light:Enable(true)
        inst.Light:SetRadius(0.5)
        inst.Light:SetFalloff(.4)
        inst.Light:SetIntensity(.5)
        inst.Light:SetColour(209 / 255, 8 / 255, 46 / 255)
    end
end

-- [[============================================================]]
--[[被动技能：自定义理智倍率 -> custom_rate_fn]]
-- TODO: 还有洞穴和月岛的考虑，主要是洞穴，月岛可能不怎么会考虑
-- 小月下：白天掉落，晚上不掉落
local function sanity_custom_setrate()
    if TheWorld.state.isday then
        return -4.98 / 60
    elseif TheWorld.state.isdusk then
        return -2.99 / 60
    elseif TheWorld.state.isnight then
        return 0
    end
end
-- 大月下：白天不掉落，晚上恢复
local function sanity_custom_grownup_setrate()
    if TheWorld.state.isday then
        return 0
    elseif TheWorld.state.isdusk then
        return 2.2425 / 60
    elseif TheWorld.state.isnight then
        return 4.485 / 60
    end
end
-- 返回结果
local function sanity_custom(inst)
    if inst:HasTag("theresaluna_grownup") then
        return sanity_custom_grownup_setrate()
    else
        return sanity_custom_setrate()
    end
end

-- [[============================================================]]
--[[被动技能：对蝙蝠类(bat/molobat)友善]]
local function CLIENT_Theresaluna_HostileTest(inst, target)
    if target.HostileToPlayerTest ~= nil then
        return target:HostileToPlayerTest(inst)
    end
    return (target:HasTag("hostile"))
        and (not target:HasTag("bat")) -- molobat也含有"bat"这个tag
end

-- [[============================================================]]
local function common_postinit(inst)
    -- Minimap icon
    inst.MiniMapEntity:SetIcon("theresaluna.tex")

    -- 修改敌对列表
    if cfg_friendlybats == "cfg_friendlybats_on" then
        inst.HostileTest = CLIENT_Theresaluna_HostileTest
    end
end

-- [[============================================================]]
local function master_postinit(inst)
    -- 基本：初始物品
    inst.starting_inventory = start_inv[TheNet:GetServerGameMode()] or start_inv.default
    -- 基本：角色声音
    inst.soundsname = "wendy"
    -- 基本：三维
    inst.components.health:SetMaxHealth(TUNING.THERESALUNA_HEALTH)
    inst.components.hunger:SetMax(TUNING.THERESALUNA_HUNGER)
    inst.components.sanity:SetMax(TUNING.THERESALUNA_SANITY)
    -- 基本：标签
    inst:AddTag("theresa")
    inst:AddTag("theresaluna")

    -- 设定：定义理智倍率 -> custom_rate_fn
    inst.components.sanity.night_drain_mult = 0
    inst.components.sanity.custom_rate_fn = sanity_custom
    -- 设定：血印槽组件
    inst:AddComponent("theresaluna_sanguine")

    --[[事件监听]]
    -- 可选能力：夜间光环
    inst:ListenForEvent("playeractivated", light_aura)
    inst:ListenForEvent("hungerdelta", light_aura) -- 绑定饥饿度变化事件，实时刷新（之后写了日间光照，可能会改为绑定精神度变化（减少点资源？）
    -- inst:ListenForEvent("sanitydelta", light_aura) -- 绑定理智度变化事件，实时刷新

    -- 其他函数
    inst.OnLoad = onload
    inst.OnNewSpawn = onload
end

return MakePlayerCharacter("theresaluna", prefabs, assets, common_postinit, master_postinit, prefabs)

-- [[============================================================]]
