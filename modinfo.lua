---@diagnostic disable: lowercase-global
-- [[============================================================]]
-- 变量
local lang = (locale ~= "zh" and locale ~= "zht" and locale ~= "zhr") -- true为默认 false为中文

-- [[============================================================]]
-- 基本信息
author = "Salt_Apocalypse"
version = "0.2"
forumthread = ""
server_filter_tags = { "character" }

name = lang and "[DST] Theresa-Luna" or "[DST] 月下初拥"
description = lang and "EN" or "ZH"

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
        name = "cfg_debug",
        label = "Debug",
        hover = "Debug Mode",
        options = {
            { description = "Off", data = "cfg_debug_no" },
            { description = "On",  data = "cfg_debug_yes" }
        },
        default = "cfg_debug_no"
    },
    {
        name = "cfg_lab_display",
        label = lang
            and "Display"
            or "显示设置",
        options = { { description = "", data = true } },
        default = true
    },
    {
        name = "cfg_lang",
        label = lang
            and "Language"
            or "语言",
        hover = lang
            and "The language to display."
            or "游戏内显示语言。",
        options = {
            { description = lang and "(Auto)" or "（自动）", data = "cfg_lang_auto" },
            { description = "English", data = "cfg_lang_EN" },
            { description = "中文", data = "cfg_lang" }
        },
        default = "cfg_lang_auto"
    },
    {
        name = "cfg_lab_abilities",
        label = lang
            and "Character Abilities"
            or "角色能力",
        options = { { description = "", data = true } },
        default = true
    },
    {
        name = "cfg_light",
        label = lang
            and "Ligth aura"
            or "夜间光环",
        hover = lang
            and "The character has a aura in the dark.\n\"\""
            or "角色在夜间拥有光环。\n“”",
        options = {
            { description = lang and "On" or "启用", data = "cfg_light_yes" },
            { description = lang and "Off" or "未启用", data = "cfg_light_no" }
        },
        default = "cfg_light_yes"
    },
    {
        name = "cfg_burden",
        label = lang
            and "Enhanced-Physique"
            or "强化体格",
        hover = lang
            and "No speed penalty from equipment.\n\"\""
            or "免受部分装备的降低移速惩罚。\n“”",
        options = {
            { description = lang and "On" or "启用", data = "cfg_burden_yes" },
            { description = lang and "Off" or "未启用", data = "cfg_burden_no" }
        },
        default = "cfg_burden_yes"
    }
}

-- [[============================================================]]
