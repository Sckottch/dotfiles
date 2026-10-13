hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 8,
        border_size = 3,
        resize_on_border = true,
        col = {
            active_border = {
                colors = THEMES.BORDER,
                angle = THEMES.ANGLE,
            },
            inactive_border = THEMES.INACTIVE,
        },
    },
    decoration = {
        dim_special = 0.3,
        rounding = 12,
        active_opacity = 0.9,
        inactive_opacity = 0.8,
        fullscreen_opacity = 1,
        blur = {
            enabled = true,
            size = 4,
            passes = 1,
        },
    },
})
