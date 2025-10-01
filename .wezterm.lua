-- Pull in the wezterm API
local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("Iosevka Nerd Font")
config.font_size = 16

config.color_scheme = "Rosé Pine (base16)"

config.window_decorations = "RESIZE"

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }

local actions = wezterm.action

local direction_keys = {
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
}

local function split_nav(key)
	return {
		key = key,
		mods = "ALT",
		action = wezterm.action_callback(function(win, pane)
			win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
		end),
	}
end

config.keys = {
	split_nav("h"),
	split_nav("j"),
	split_nav("k"),
	split_nav("l"),
	{
		key = "a",
		mods = "LEADER",
		action = actions.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }),
	},
	{
		key = "w",
		mods = "LEADER",
		action = actions.PromptInputLine({
			description = "Enter name for new workspace",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:perform_action(
						actions.SwitchToWorkspace({
							name = line,
						}),
						pane
					)
				end
			end),
		}),
	},
	{
		key = "h",
		mods = "LEADER",
		action = actions.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "v",
		mods = "LEADER",
		action = actions.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "h",
		mods = "CTRL|SHIFT",
		action = actions.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "l",
		mods = "CTRL|SHIFT",
		action = actions.AdjustPaneSize({ "Right", 5 }),
	},
	{
		key = "j",
		mods = "CTRL|SHIFT",
		action = actions.AdjustPaneSize({ "Down", 5 }),
	},
	{
		key = "k",
		mods = "CTRL|SHIFT",
		action = actions.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "m",
		mods = "ALT",
		action = actions.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "p",
		mods = "ALT",
		action = actions.ActivateTabRelative(-1),
	},
	{
		key = "n",
		mods = "ALT",
		action = actions.ActivateTabRelative(1),
	},
	{ key = "[", mods = "LEADER", action = actions.ActivateCopyMode },
}

config.status_update_interval = 1000

wezterm.on("update-status", function(window, _)
	local workspace = window:active_workspace()
	window:set_right_status(wezterm.format({
		{ Text = workspace .. "   " },
	}))
end)

return config
