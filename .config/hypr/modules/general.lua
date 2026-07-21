hl.config({
    general = {
        layout = "scrolling",

        gaps_in = 3,
        gaps_out = {
            top = 0,
            bottom = 5,
            left = 5,
            right = 5,
        },
        gaps_workspaces = 50,

        border_size = 0,

        col = {
            active_border = "rgba(0DB7D455)",
            inactive_border = "rgba(31313600)"
        },
        resize_on_border = true,

        no_focus_fallback = true,
        allow_tearing = true,
        snap = {
            enabled = true,
            window_gap = 4,
            monitor_gap = 5,
            respect_gaps = true
        }
    },
    scrolling = {
        fullscreen_on_one_column = true,
        column_width = 0.9,
        direction = "right",
        follow_focus = true,
        focus_fit_method = 1,
        wrap_focus = true,
        wrap_swapcol = true,
    },
    gestures = {
        scrolling = {
            move_snap_to_grid = true,
            move_snap_cursor = true,
        },
        -- workspace swipe
        workspace_swipe_distance = 700,
        workspace_swipe_cancel_ratio = 0.2,
        workspace_swipe_min_speed_to_force = 5,
        workspace_swipe_direction_lock = true,
        workspace_swipe_direction_lock_threshold = 10,
        workspace_swipe_create_new = true,
    }
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "scroll_move",
})

hl.gesture({
    fingers = 4,
    direction = "vertical",
    action = "workspace",
})

hl.config({
    decoration = {
        rounding_power = 2.5,
        rounding = 18,

        blur = {
            enabled = true,
            xray = true,
            special = false,
            new_optimizations = true,
            size = 10,
            passes = 3,
            -- size = 14,
            -- passes = 3,
            brightness = 1,
            noise = 0.01,
            contrast = 1,
            popups = true,
            popups_ignorealpha = 0.6,
            input_methods = true,
            input_methods_ignorealpha = 0.8
        },
        shadow = {
            enabled = true,
            range = 20,
            offset = { 0, 2 },
            render_power = 10,
            color = "rgba(00000020)"
        },
        dim_inactive = true,
        dim_strength = 0.025,
        dim_special = 0.07,

        active_opacity = 0.88,
        inactive_opacity = 0.84
    },
    dwindle = {
        preserve_split = true,
        smart_split = false,
        smart_resizing = false
    },
    input = {
        kb_layout = "latam",

        touchpad = {
            natural_scroll = true,
        }
    },
})
