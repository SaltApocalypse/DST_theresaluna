-- prefab预制体加载
PrefabFiles = {
    "__theresa__",
    "__theresa___none",
}
-- Assets资源加载
Assets = {
    -- bigportraits
    Asset("IMAGE", "bigportraits/__theresa__.tex"),
    Asset("ATLAS", "bigportraits/__theresa__.xml"),
    -- avatars/avatar_ghost/self_inspect
    Asset("IMAGE", "images/avatars/avatar___theresa__.tex"),
    Asset("ATLAS", "images/avatars/avatar___theresa__.xml"),
    Asset("IMAGE", "images/avatars/avatar_ghost___theresa__.tex"),
    Asset("ATLAS", "images/avatars/avatar_ghost___theresa__.xml"),
    Asset("IMAGE", "images/avatars/self_inspect___theresa__.tex"),
    Asset("ATLAS", "images/avatars/self_inspect___theresa__.xml"),
    -- map_icons/saveslot_portraits/selectscreen_portraits
    Asset("IMAGE", "images/map_icons/__theresa__.tex"),
    Asset("ATLAS", "images/map_icons/__theresa__.xml"),
    Asset("IMAGE", "images/saveslot_portraits/__theresa__.tex"),
    Asset("ATLAS", "images/saveslot_portraits/__theresa__.xml"),
    Asset("IMAGE", "images/selectscreen_portraits/__theresa__.tex"),
    Asset("ATLAS", "images/selectscreen_portraits/__theresa__.xml"),
    Asset("IMAGE", "images/selectscreen_portraits/__theresa___silho.tex"),
    Asset("ATLAS", "images/selectscreen_portraits/__theresa___silho.xml"),
    -- names/names_gold
    Asset("IMAGE", "images/names___theresa__.tex"),
    Asset("ATLAS", "images/names___theresa__.xml"),
    Asset("IMAGE", "images/names_gold___theresa__.tex"),
    Asset("ATLAS", "images/names_gold___theresa__.xml"),
    -- anim
    -- Asset("ANIM", "anim/__theresa___anim.zip"),

    -- Widget __theresa___image_sanguinebadge_dst/_hi3
    Asset("IMAGE", "images/__theresa___image_sanguinebadge_dst.tex"),
    Asset("ATLAS", "images/__theresa___image_sanguinebadge_dst.xml"),
}

--[[ 设置GLOBAL变量 ]]
local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

--[[ 获取并确定游戏语言选择 ]]
STRINGS.CHARACTER_NAMES.__theresa__ = "__theresa__" -- 名字
STRINGS.CHARACTER_TITLES.__theresa__ = "__theresa__" -- 标签（人物图下面）
STRINGS.CHARACTER_DESCRIPTIONS.__theresa__ = "*是吸血鬼，怕光\n*是老婆，请好好呵护\n*会变身" -- 人物描述（标签下面）
STRINGS.CHARACTER_SURVIVABILITY.__theresa__ = "你会一直陪伴着我嘛？" -- 生存几率（人物图右侧）
STRINGS.CHARACTER_QUOTES.__theresa__ = "\"人类，快给我准备温暖的血液！\"" -- 角色引言
STRINGS.CHARACTER_ABOUTME.__theresa__ = ""       -- 关于我（我还没找到这个在游戏中哪里有出现）

-- local mod_language = GetModConfigData("lang") -- 从modinfo中获取设置的关键字
-- if mod_language == 0 then
--     if STRINGS.UI.OPTIONS.LANGUAGES == "语言" then
--         mod_language = 2
--     else
--         mod_language = 1
--     end
-- end
-- --[[ 具体文本修改 ]]
-- if mod_language == 2 then -- Chinese
--     STRINGS.CHARACTER_NAMES.__theresa__ = "__theresa__" -- 名字
--     STRINGS.CHARACTER_TITLES.__theresa__ = "__theresa__" -- 标签（人物图下面）
--     STRINGS.CHARACTER_DESCRIPTIONS.__theresa__ = "*是吸血鬼，怕光\n*是老婆，请好好呵护" -- 人物描述（标签下面）
--     STRINGS.CHARACTER_SURVIVABILITY.__theresa__ = "你会一直陪伴着我嘛？" -- 生存几率（人物图右侧）
--     STRINGS.CHARACTER_QUOTES.__theresa__ = "\"人类，快给我准备温暖的血液！\"" -- 角色引言
--     -- STRINGS.CHARACTER_ABOUTME.__theresa__ = ""       -- 关于我（我还没找到这个在游戏中哪里有出现）
-- else -- English
--     STRINGS.CHARACTER_NAMES.__theresa__ = "E"
--     STRINGS.CHARACTER_TITLES.__theresa__ = "E"
--     STRINGS.CHARACTER_DESCRIPTIONS.__theresa__ = "E"
--     STRINGS.CHARACTER_SURVIVABILITY.__theresa__ = "E"
--     STRINGS.CHARACTER_QUOTES.__theresa__ = "E"
--     -- STRINGS.CHARACTER_ABOUTME.__theresa__ = ""
-- end

--[[ 自定义语言 ]]
STRINGS.CHARACTERS.__THERESA__ = require "speech___theresa__"
-- STRINGS.CHARACTERS.__theresa__ = require "speech_wendy" -- 文本套用【温蒂 Wendy】，对部分进行修改

--[[ 角色在游戏中的名字 ]]
STRINGS.NAMES.__THERESA__ = "__teri__"
STRINGS.SKIN_NAMES.__theresa___none = "__teri__"

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

--[[ 加载地图上图像和mod角色信息 ]]
AddMinimapAtlas("images/map_icons/__theresa__.xml")
AddModCharacter("__theresa__", "FEMALE", skin_modes)

--[[ __theresa___widget_sanguinebadge_dst ]]
local __theresa___widget_sanguinebadge_dst = require("widgets/__theresa___widget_sanguinebadge_dst")
AddClassPostConstruct("widgets/controls", function(self, owner)
    self.__theresa___widget_sanguinebadge_dst = self:AddChild(__theresa___widget_sanguinebadge_dst(self.owner))

    self.__theresa___widget_sanguinebadge_dst:SetHAnchor(2) -- x坐标-中左右
    self.__theresa___widget_sanguinebadge_dst:SetVAnchor(1) -- y坐标-中上下

    -- self.__theresa___widget_sanguinebadge_dst:SetPosition(-93, -366) -- (-93, -365.85)
    self.__theresa___widget_sanguinebadge_dst:SetPosition(-93, -330) -- (-93, -365.85)

    self.__theresa___widget_sanguinebadge_dst:Show()
end)
