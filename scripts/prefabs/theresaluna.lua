-- [[============================================================]]
local MakePlayerCharacter = require "prefabs/player_common"
local assets = { Asset("SCRIPT", "scripts/prefabs/player_common.lua") }

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

    -- 血印槽组件
    inst:AddComponent("theresaluna_sanguine")

    inst.OnLoad = onload
    inst.OnNewSpawn = onload
end

return MakePlayerCharacter("theresaluna", prefabs, assets, common_postinit, master_postinit, prefabs)
