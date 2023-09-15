-- [[============================================================]]
-- 引入
local MakePlayerCharacter = require "prefabs/player_common"
local assets = { Asset("SCRIPT", "scripts/prefabs/player_common.lua") }
-- 设置
-- local theresaluna = require ""
-- local cfg_light = theresaluna.GetModConfigData("cfg_light")
local cfg_light = TUNING.THERESALUNA_cfg_light

-- [[============================================================]]
-- 初始物品
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
    inst.components.locomotor:SetExternalSpeedMultiplier(inst,
        "theresaluna_speed_mod",
        1)
end

local function onbecameghost(inst)
    inst.components.locomotor:RemoveExternalSpeedMultiplier(inst,
        "theresaluna_speed_mod")
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
-- cfg_light 角色自发光
local function self_illumination(inst, data)
    local light = inst.entity:AddLight()
    if cfg_light == "cfg_light_no" or TheWorld.state.isday or TheWorld.state.isdusk then
        inst.Light:SetRadius(0)
        light:Enable(false)
    elseif cfg_light == "cfg_light_yes" and TheWorld.state.isnight then
        inst.Light:Enable(true)
        inst.Light:SetRadius(0.5)
        inst.Light:SetFalloff(.4)
        inst.Light:SetIntensity(.5)
        -- inst.Light:SetColour(197 / 255, 197 / 255, 50 / 255) -- TODO:选择一个深红的颜色
        inst.Light:SetColour(127 / 255, 0 / 255, 0 / 255) -- TODO:选择一个深红的颜色
    end
end

-- [[============================================================]]
local function common_postinit(inst)
    -- Minimap icon
    inst.MiniMapEntity:SetIcon("theresaluna.tex")
end

-- [[============================================================]]
local function master_postinit(inst)
    -- 初始物品
    inst.starting_inventory = start_inv[TheNet:GetServerGameMode()] or start_inv.default
    -- 角色声音
    inst.soundsname = "wendy"
    -- 三维
    inst.components.health:SetMaxHealth(TUNING.THERESALUNA_HEALTH)
    inst.components.hunger:SetMax(TUNING.THERESALUNA_HUNGER)
    inst.components.sanity:SetMax(TUNING.THERESALUNA_SANITY)

    inst.OnLoad = onload
    inst.OnNewSpawn = onload

    -- 血印槽组件
    inst:AddComponent("theresaluna_sanguine")

    -- 事件监听
    -- 自带光源
    inst:ListenForEvent("playeractivated", self_illumination)
    inst:ListenForEvent("hungerdelta", self_illumination) -- 绑定饥饿度变化事件，实时刷新（之后写了日间光照，可能会改为绑定精神度变化（减少点资源？）
    -- inst:ListenForEvent("sanitydelta", self_illumination) -- 绑定饥饿度变化事件，实时刷新
end

return MakePlayerCharacter("theresaluna", prefabs, assets, common_postinit, master_postinit, prefabs)
