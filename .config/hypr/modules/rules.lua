-- Picture-in-Picture
hl.window_rule({ match = { title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$" }, float = true })
hl.window_rule({ match = { title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$" }, keep_aspect_ratio = true })
hl.window_rule({ match = { title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$" }, move = { "(monitor_w*0.73)", "(monitor_h*0.72)" } })
hl.window_rule({ match = { title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$" }, size = { "(monitor_w*0.25)", "(monitor_h*0.25)" } })
hl.window_rule({ match = { title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$" }, float = true })
hl.window_rule({ match = { title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$" }, pin = true })

-- Special workspace
hl.workspace_rule({ workspace = "special:special", gaps_out = 30 })

-- discord popout-pip pin --
hl.window_rule({
    name = "discord-popout-pip",
    match = { class = "discord|vesktop", title = ".*Pop.*|.*Picture.*|.*Discord.*" },
    float = true,
    pin = true,
    keep_aspect_ratio = true,
    size = "640 360",
})

-- Mision Center
hl.window_rule({
    name = "mission-center",
    match = { class = "io.missioncenter.MissionCenter" },
    float = true,
    size = { "(monitor_w*0.6)", "(monitor_h*0.7)" },
})

-- Vicinae
hl.layer_rule({
    match = { namespace = "vicinae" },
    name = "vicinae-blur",
    blur = true,
    ignore_alpha = 0,
})
hl.layer_rule({
    match = { namespace = "vicinae" },
    name = "vicinae-no-animation",
    no_anim = true,
})

-- Barrita
hl.layer_rule({
    match = { namespace = "control-center" },
    order = 10,
})
hl.layer_rule({
    match = { namespace = "barrita" },
    order = 20,
})
hl.layer_rule({
    match = { namespace = "dock" },
    name = "dock-blur",
    blur = true,
    ignore_alpha = 0.02,
    xray = false,
})
hl.layer_rule({
    match = { namespace = "dock" },
    name = "dock-no-animation",
    no_anim = true,
})
hl.layer_rule({
    match = { namespace = "dock-hotspot" },
    name = "dock-hotspot-no-animation",
    no_anim = true,
})
