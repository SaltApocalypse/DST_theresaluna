-- [[============================================================]]
local lang = true -- ture为默认 false为中文

-- [[============================================================]]
if GetModConfigData("cfg_lang") == "cfg_lang_auto" then
    -- 自动获取去语言
    local lang_auto = require "languages/loc".GetLanguage()
    if lang_auto == LANGUAGE.CHINESE_S or LANGUAGE.chinese_t or LANGUAGE.CHINESE_S_RAIL then
        lang = false
    else
        lang = true
    end
else
    lang = GetModConfigData("cfg_lang") == "cfg_lang_EN"
end

-- [[============================================================]]
LANGUAGE_SETTING = lang

-- 根据语言设置选择合适的文本显示
function Loc(e, c)
    return LANGUAGE_SETTING and e or c
end

TUNING.THERESALUNA_LANGUAGE_SETTING = LANGUAGE_SETTING
GLOBAL.THERESALUNA_LANGUAGE_LOC = Loc
