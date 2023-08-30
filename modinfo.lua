-- [[[============================================================]]]

-- 基本信息
name = "[DST] 德丽莎·阿波卡利斯"
description = "来自崩坏系列游戏的角色德丽莎·阿波卡利斯——“德丽莎世界第一可爱！Biu~”"
author = "Salt_Apocalypse"
version = "0.1"
forumthread = ""
server_filter_tags = { "character" }
-- modicon
icon_atlas = "modicon.xml"
icon = "modicon.tex"
-- DS&DST兼容性
dst_compatible = true
dont_starve_compatible = false
reign_of_giants_compatible = false
shipwrecked_compatible = false
-- 所有客户端都需要安装，非客户端mod
all_clients_require_mod = true
-- 饥荒api版本，固定填10
api_version = 10
priority = -1

-- [[[============================================================]]]

-- 设置
configuration_options = {
    -- {
    --     name = "显示",
    --     hover = "",
    --     options = { { description = "", data = 0 } },
    --     default = 0
    -- },
    -- {
    --     name = "display_ui",
    --     label = "血印UI样式",
    --     hover = "血印UI样式",
    --     options = {
    --         { description = "默认", data = "dst_like", hover = "像饥荒三维属性那样挂在右上角。" },
    --         { description = "崩三血印槽", data = "hi3_like", hover = "像崩三一样置于底部栏上方中间。" },
    --     },
    --     default = "dst_like",
    -- },
}

-- [[[============================================================]]]

-- -- 借鉴自 Insight
-- local a = ChooseTranslationTable
-- ChooseTranslationTable = nil
-- local ChooseTranslationTable, a = a, nil

-- local function T(tbl, key)
--     if locale and ChooseTranslationTable then
--         return ChooseTranslationTable(tbl, key)
--     else
--         return tbl[1]
--     end
-- end

-- local function AddSectionTitle(title)
--     return {
--         name = title:upper(), -- 避免冲突
--         label = title,
--         options = { { description = "", data = 0 } },
--         default = 0,
--         tags = { "ignore" },
--     }
-- end

-- -- 文字
-- local STRINGS = {
--     -- >>> 选项卡标签 <<<
--     -- 格式
--     sectiontitle_formatting = {
--         "Formatting",
--         ["zh"] = "格式",
--     },
--     -- 元素
--     sectiontitle_elements = {
--         "UI",
--         ["zh"] = "元素",
--     },
--     -- 角色
--     sectiontitle_character = {
--         "Character",
--         ["zh"] = "角色",
--     },
--     -- >>> 选项标签 <<<
--     -- 选项卡标签-格式
--     lang = {
--         label = {
--             "Language",
--             ["zh"] = "语言",
--         },
--         hover = {
--             "The language to display.",
--             ["zh"] = "显示语言",
--         },
--         options = {
--             ["automatic"] = {
--                 description = {
--                     "Automatic",
--                     ["zh"] = "自动",
--                 },
--                 hover = {
--                     "Uses your current language settings.",
--                     ["zh"] = "使用游戏当前的语言设定",
--                 },
--             },
--             ["en"] = {
--                 description = {
--                     "English",
--                     ["zh"] = "英语",
--                 },
--                 hover = {
--                     "English",
--                     ["zh"] = "英语",
--                 },
--             },
--             ["zh"] = {
--                 description = {
--                     "Chinese",
--                     ["zh"] = "中文",
--                 },
--                 hover = {
--                     "Chinese",
--                     ["zh"] = "中文",
--                 },
--             },
--         },
--     },
--     -- 选项卡标签-元素

-- }

-- -- 设置
-- configuration_options = {
--     AddSectionTitle(T(STRINGS["sectiontitle_formatting"])),
--     {
--         name = "lang",
--         options = {
--             { data = "automatic" },
--             { data = "en" },
--             { data = "zh" },
--         },
--         default = "automatic",
--         client = true,
--         tags = {},
--     },
--     AddSectionTitle(T(STRINGS["sectiontitle_elements"])),
--     {
--         name = "sanguine_ui_sytle",
--         options = {
--             { data = "dst_like" },
--             { data = "hi3_like" },
--         },
--         default = "dst_like",
--         client = true,
--         tags = {},
--     },
--     AddSectionTitle(T(STRINGS["sectiontitle_character"])),
-- }

-- [[[============================================================]]]
