local assets =
{
	Asset("ANIM", "anim/__theresa__.zip"),
	Asset("ANIM", "anim/ghost___theresa___build.zip"),
}

local skins =
{
	normal_skin = "__theresa__",
	ghost_skin = "ghost___theresa___build",
}

return CreatePrefabSkin("__theresa___none",
	{
		base_prefab = "__theresa__",
		type = "base",
		assets = assets,
		skins = skins,
		skin_tags = { "__THERESA__", "CHARACTER", "BASE" },
		build_name_override = "__theresa__",
		rarity = "Character",
	})
