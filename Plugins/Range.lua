
assert(BigWigs, "BigWigs not found!")

------------------------------
--      Are you local?      --
------------------------------

local L = AceLibrary("AceLocale-2.2"):new("BigWigsRange")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	["Range"] = true,
	["range"] = true,
	["Options for the combat log's range."] = true,

	["party"] = true,
	["Party"] = true,
	["Party combat log range."] = true,

	["friend"] = true,
	["Friendlies"] = true,
	["Friendly players combat log range."] = true,

	["hostile"] = true,
	["Hostiles"] = true,
	["Hostile players combat log range."] = true,

	["mob"] = true,
	["Creatures"] = true,
	["Creature combat log range."] = true,

	["death"] = true,
	["Deaths"] = true,
	["Death message range."] = true,

	["reset"] = true,
	["Reset to defaults"] = true,
	["Resets all ranges to defaults."] = true,
} end)

----------------------------------
--      Module Declaration      --
----------------------------------

BigWigsRange = BigWigs:NewModule(L["Range"])
BigWigsRange.consoleCmd = L["range"]
BigWigsRange.consoleOptions = {
	type = "group",
	name = L["Range"],
	desc = L["Options for the combat log's range."],
	args   = {
		[L["party"]] = {
			type = "range",
			name = L["Party"],
			desc = L["Party combat log range."],
			order = 1,
			min = 195,
			max = 200,
			step = 5,
			get = function() return GetCVar("CombatLogRangeParty") end,
			set = function(v)
				SetCVar("CombatLogRangeParty", v)
				SetCVar("CombatLogRangePartyPet", v)
			end,
		},
		[L["friend"]] = {
			type = "range",
			name = L["Friendlies"],
			desc = L["Friendly players combat log range."],
			order = 2,
			min = 195,
			max = 200,
			step = 5,
			get = function() return GetCVar("CombatLogRangeFriendlyPlayers") end,
			set = function(v)
				SetCVar("CombatLogRangeFriendlyPlayers", v)
				SetCVar("CombatLogRangeFriendlyPlayersPets", v)
			end,
		},
		[L["hostile"]] = {
			type = "range",
			name = L["Hostiles"],
			desc = L["Hostile players combat log range."],
			order = 3,
			min = 195,
			max = 200,
			step = 5,
			get = function() return GetCVar("CombatLogRangeHostilePlayers") end,
			set = function(v)
				SetCVar("CombatLogRangeHostilePlayers", v)
				SetCVar("CombatLogRangeHostilePlayersPets", v)
			end,
		},
		[L["mob"]] = {
			type = "range",
			name = L["Creatures"],
			desc = L["Creature combat log range."],
			order = 4,
			min = 195,
			max = 200,
			step = 5,
			get = function() return GetCVar("CombatLogRangeCreature") end,
			set = function(v) SetCVar("CombatLogRangeCreature", v) end,
		},
		[L["death"]] = {
			type = "range",
			name = L["Deaths"],
			desc = L["Death message range."],
			order = 5,
			min = 195,
			max = 200,
			step = 5,
			get = function() return GetCVar("CombatDeathLogRange") end,
			set = function(v) SetCVar("CombatDeathLogRange", v) end,
		},
		[L["reset"]] = {
			type = "execute",
			name = L["Reset to defaults"],
			order = -1,
			desc = L["Resets all ranges to defaults."],
			func = function()
				SetCVar("CombatDeathLogRange", 200)
				SetCVar("CombatLogRangeParty", 200)
				SetCVar("CombatLogRangePartyPet", 200)
				SetCVar("CombatLogRangeFriendlyPlayers", 200)
				SetCVar("CombatLogRangeFriendlyPlayersPets", 200)
				SetCVar("CombatLogRangeHostilePlayers", 200)
				SetCVar("CombatLogRangeHostilePlayersPets", 200)
				SetCVar("CombatLogRangeCreature", 200)
			end,
		},
	},
}
