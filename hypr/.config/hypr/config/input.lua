hl.config({
    input = {
        kb_layout = "br",
        kb_variant = "abnt2",
        kb_options = "caps:escape_shifted_capslock",
        follow_mouse = 1,
        sensitivity = 0,
        accel_profile = "flat",
        touchpad = {
            natural_scroll = true,
            tap_to_click = true,
            disable_while_typing = true,
            clickfinger_behavior = true,
        }
    },
	cursor = {
		enable_hyprcursor = false,
	},
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})
