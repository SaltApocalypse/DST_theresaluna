-- [[============================================================]]
GLOBAL.setmetatable(env, { __index = function(t, k) return GLOBAL.rawget(GLOBAL, k) end })

-- [[============================================================]]
-- Assets资源加载
Assets = {}

-- prefab预制体加载
PrefabFiles = { "theresaluna", "theresaluna_none" }

-- [[============================================================]]
-- 引入模组组成

-- modimport "modmain/debug.lua" -- 调试模块

modimport "modmain/language.lua"
modimport "modmain/character.lua"
modimport "modmain/tuning.lua"
modimport "modmain/player.lua"
-- modimport "modmain/playernet.lua" -- 玩家网络通讯
-- modimport "modmain/postprocess.lua" -- 后处理
-- modimport "modmain/action.lua" -- 动作
-- modimport "modmain/sg.lua" -- sg
-- modimport "modmain/recipes.lua" -- 配方
-- modimport "modmain/fx.lua" --  特效
-- modimport "modmain/rpc.lua" -- rpc

-- [[============================================================]]
-- 废弃资源
-- Assets = {
--     -- bigportraits
--     Asset("IMAGE", "bigportraits/theresaluna.tex"),
--     Asset("ATLAS", "bigportraits/theresaluna.xml"),
--     -- avatars/avatar_ghost/self_inspect
--     Asset("IMAGE", "images/avatars/avatar_theresaluna.tex"),
--     Asset("ATLAS", "images/avatars/avatar_theresaluna.xml"),
--     Asset("IMAGE", "images/avatars/avatar_ghost_theresaluna.tex"),
--     Asset("ATLAS", "images/avatars/avatar_ghost_theresaluna.xml"),
--     Asset("IMAGE", "images/avatars/self_inspect_theresaluna.tex"),
--     Asset("ATLAS", "images/avatars/self_inspect_theresaluna.xml"),
--     -- map_icons/saveslot_portraits/selectscreen_portraits
--     Asset("IMAGE", "images/map_icons/theresaluna.tex"),
--     Asset("ATLAS", "images/map_icons/theresaluna.xml"),
--     Asset("IMAGE", "images/saveslot_portraits/theresaluna.tex"),
--     Asset("ATLAS", "images/saveslot_portraits/theresaluna.xml"),
--     Asset("IMAGE", "images/selectscreen_portraits/theresaluna.tex"),
--     Asset("ATLAS", "images/selectscreen_portraits/theresaluna.xml"),
--     Asset("IMAGE", "images/selectscreen_portraits/theresaluna_silho.tex"),
--     Asset("ATLAS", "images/selectscreen_portraits/theresaluna_silho.xml"),
--     -- names/names_gold
--     Asset("IMAGE", "images/names_theresaluna.tex"),
--     Asset("ATLAS", "images/names_theresaluna.xml"),
--     Asset("IMAGE", "images/names_gold_theresaluna.tex"),
--     Asset("ATLAS", "images/names_gold_theresaluna.xml")

--     -- Widget theresaluna_image_sanguinebadge_dst/_hi3
--     -- Asset("IMAGE", "images/theresaluna_image_sanguinebadge_dst.tex"),
--     -- Asset("ATLAS", "images/theresaluna_image_sanguinebadge_dst.xml"),
-- }

-- --[[ 设置GLOBAL变量 ]]
-- local require = GLOBAL.require
-- local STRINGS = GLOBAL.STRINGS

-- --[[ 获取并确定游戏语言选择 ]]
-- STRINGS.CHARACTER_NAMES.theresaluna = "theresaluna" -- 名字
-- STRINGS.CHARACTER_TITLES.theresaluna = "theresaluna" -- 标签（人物图下面）
-- STRINGS.CHARACTER_DESCRIPTIONS.theresaluna =
--     "*是吸血鬼，怕光\n*是老婆，请好好呵护\n*会变身" -- 人物描述（标签下面）
-- STRINGS.CHARACTER_SURVIVABILITY.theresaluna = "你会一直陪伴着我嘛？" -- 生存几率（人物图右侧）
-- STRINGS.CHARACTER_QUOTES.theresaluna =
--     "\"人类，快给我准备温暖的血液！\"" -- 角色引言
-- STRINGS.CHARACTER_ABOUTME.theresaluna = "" -- 关于我（我还没找到这个在游戏中哪里有出现）

-- --[[ 自定义语言 ]]
-- STRINGS.CHARACTERS.THERESALUNA = require "speech_theresaluna"
-- -- STRINGS.CHARACTERS.theresaluna = require "speech_wendy" -- 文本套用【温蒂 Wendy】，对部分进行修改

-- --[[ 角色在游戏中的名字 ]]
-- STRINGS.NAMES.THERESALUNA = "__teri__"
-- STRINGS.SKIN_NAMES.theresaluna_none = "__teri__"

-- -- The skins shown in the cycle view window on the character select screen.
-- -- A good place to see what you can put in here is in skinutils.lua, in the function GetSkinModes
-- local skin_modes = {
--     {
--         type = "ghost_skin",
--         anim_bank = "ghost",
--         idle_anim = "idle",
--         scale = 0.75,
--         offset = {0, -25}
--     }
-- }

-- --[[ 加载地图上图像和mod角色信息 ]]
-- AddMinimapAtlas("images/map_icons/theresaluna.xml")
-- AddModCharacter("theresaluna", "FEMALE", skin_modes)

-- -- --[[ theresaluna_sanguinebadge ]]
-- -- local theresaluna_sanguinebadge = require("widgets/theresaluna_sanguinebadge")
-- -- AddClassPostConstruct("widgets/controls", function(self, owner)
-- --     self.theresaluna_sanguinebadge = self:AddChild(theresaluna_sanguinebadge(self.owner))

-- --     self.theresaluna_sanguinebadge:SetHAnchor(2) -- x坐标-中左右
-- --     self.theresaluna_sanguinebadge:SetVAnchor(1) -- y坐标-中上下

-- --     -- self.theresaluna_sanguinebadge:SetPosition(-93, -366) -- (-93, -365.85)
-- --     self.theresaluna_sanguinebadge:SetPosition(-93, -330) -- (-93, -365.85)

-- --     self.theresaluna_sanguinebadge:Show()
-- -- end)
