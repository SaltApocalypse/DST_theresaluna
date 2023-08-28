-- prefab预制体加载
PrefabFiles = {
    "esctemplate",
    "esctemplate_none",
}
-- Assets资源加载
Assets = {
    -- bigportraits
    Asset("IMAGE", "bigportraits/esctemplate.tex"),
    Asset("ATLAS", "bigportraits/esctemplate.xml"),
    -- avatars/avatar_ghost/self_inspect
    Asset("IMAGE", "images/avatars/avatar_esctemplate.tex"),
    Asset("ATLAS", "images/avatars/avatar_esctemplate.xml"),
    Asset("IMAGE", "images/avatars/avatar_ghost_esctemplate.tex"),
    Asset("ATLAS", "images/avatars/avatar_ghost_esctemplate.xml"),
    Asset("IMAGE", "images/avatars/self_inspect_esctemplate.tex"),
    Asset("ATLAS", "images/avatars/self_inspect_esctemplate.xml"),
    -- map_icons/saveslot_portraits/selectscreen_portraits
    Asset("IMAGE", "images/map_icons/esctemplate.tex"),
    Asset("ATLAS", "images/map_icons/esctemplate.xml"),
    Asset("IMAGE", "images/saveslot_portraits/esctemplate.tex"),
    Asset("ATLAS", "images/saveslot_portraits/esctemplate.xml"),
    Asset("IMAGE", "images/selectscreen_portraits/esctemplate.tex"),
    Asset("ATLAS", "images/selectscreen_portraits/esctemplate.xml"),
    Asset("IMAGE", "images/selectscreen_portraits/esctemplate_silho.tex"),
    Asset("ATLAS", "images/selectscreen_portraits/esctemplate_silho.xml"),
    -- names/names_gold
    Asset("IMAGE", "images/names_esctemplate.tex"),
    Asset("ATLAS", "images/names_esctemplate.xml"),
    Asset("IMAGE", "images/names_gold_esctemplate.tex"),
    Asset("ATLAS", "images/names_gold_esctemplate.xml"),
    -- anim
    -- Asset("ANIM", "anim/esctemplate_anim.zip"),
}

-- 设置GLOBAL变量
local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

-- 获取并确定游戏语言选择
local mod_language = GetModConfigData("lang") -- 从modinfo中获取设置的关键字
if mod_language == 0 then
    if STRINGS.UI.OPTIONS.LANGUAGES == "语言" then
        mod_language = 2
    else
        mod_language = 1
    end
end
-- 具体文本修改
if mod_language == 2 then -- Chinese
    STRINGS.CHARACTER_NAMES.esctemplate = "__theresa__" -- 名字
    STRINGS.CHARACTER_TITLES.esctemplate = "__theresa__" -- 标签（人物图下面）
    STRINGS.CHARACTER_DESCRIPTIONS.esctemplate = "*是吸血鬼，怕光\n*是老婆，请好好呵护" -- 人物描述（标签下面）
    STRINGS.CHARACTER_SURVIVABILITY.esctemplate = "你会一直陪伴着我嘛？" -- 生存几率（人物图右侧）
    STRINGS.CHARACTER_QUOTES.esctemplate = "\"人类，快给我准备温暖的血液！\"" -- 角色引言
    -- STRINGS.CHARACTER_ABOUTME.esctemplate = ""       -- 关于我（我还没找到这个在游戏中哪里有出现）
else -- English
    STRINGS.CHARACTER_NAMES.esctemplate = "E"
    STRINGS.CHARACTER_TITLES.esctemplate = "E"
    STRINGS.CHARACTER_DESCRIPTIONS.esctemplate = "E"
    STRINGS.CHARACTER_SURVIVABILITY.esctemplate = "E"
    STRINGS.CHARACTER_QUOTES.esctemplate = "E"
    -- STRINGS.CHARACTER_ABOUTME.esctemplate = ""
end
-- 自定义语言
STRINGS.CHARACTERS.ESCTEMPLATE = require "speech_esctemplate"
-- STRINGS.CHARACTERS.__theresa__ = require "speech_wendy" -- 文本套用【温蒂 Wendy】，对部分进行修改

-- 角色在游戏中的名字
STRINGS.NAMES.ESCTEMPLATE = "__teri__"
STRINGS.SKIN_NAMES.esctemplate_none = "__teri__"

-- The skins shown in the cycle view window on the character select screen.
-- A good place to see what you can put in here is in skinutils.lua, in the function GetSkinModes
local skin_modes = {
    {
        type = "ghost_skin",
        anim_bank = "ghost",
        idle_anim = "idle",
        scale = 0.75,
        offset = { 0, -25 }
    },
}

-- 加载地图上图像和mod角色信息
AddMinimapAtlas("images/map_icons/esctemplate.xml")
AddModCharacter("esctemplate", "FEMALE", skin_modes)
