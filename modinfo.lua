-- [[============================================================]]
-- 变量
local lang = (locale ~= "zh" and locale ~= "zhr" and locale ~= "zhr") -- true为默认 false为中文

-- [[============================================================]]
-- 基本信息
author = "Salt_Apocalypse"
version = "0.1"
forumthread = ""
server_filter_tags = { "character" }

if lang then
    name = "[DST] Luna_Lindred"
    description = "CN"
else
    name = "[DST] 月下初拥"
    description = "ZH"
end

-- DS&DST兼容性
dst_compatible = true
dont_starve_compatible = false
-- 所有客户端都需要安装，非客户端mod
all_clients_require_mod = true
-- 饥荒api版本，固定填10
api_version = 10
-- 加载优先度
priority = -1

-- modicon
icon_atlas = "modicon.xml"
icon = "modicon.tex"

-- [[============================================================]]
-- 设置
configuration_options = {
    {
        name = "cfg_lab_display",
        label = lang and "Display" or "显示设置",
        options = { { description = "", data = true } },
        default = true
    },
    {
        name = "cfg_lang",
        label = lang and "Language" or "语言",
        hover = lang and "The language to display." or "游戏内显示语言。",
        options = {
            { description = lang and "(Auto)" or "（自动）", data = "cfg_lang_auto" },
            { description = "English", data = "cfg_lang_EN" },
            { description = "中文", data = "cfg_lang" }
        },
        default = "cfg_lang_auto"
    }
}

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

-- [[============================================================]]
