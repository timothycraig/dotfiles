local wezterm = require("wezterm")

return {
	-- font = wezterm.font("JetBrains Mono", { weight = "Light" }),
	font_size = 18,

	enable_tab_bar = false,

	window_decorations = "RESIZE",
	native_macos_fullscreen_mode = true,

	macos_window_background_blur = 5,
	window_background_opacity = 0.8,

	keys = {
		{
			key = "f",
			mods = "CMD|CTRL",
			action = wezterm.action.ToggleFullScreen,
		},
	},
	mouse_bindings = {
		-- Ctrl-click will open the link under the mouse cursor
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = wezterm.action.OpenLinkAtMouseCursor,
		},
	},
}
