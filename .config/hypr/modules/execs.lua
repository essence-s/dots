hl.on("hyprland.start", function()
    --ntfs
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
    --hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
    -- fondo de pantalla
    -- hl.exec_cmd("hyprpaper")
    -- hl.exec_cmd('mpvpaper ALL -o "no-audio --loop" /home/styv/Wallpapers/tu-video.mp4')
    -- hl.exec_cmd("mpvpaper -o 'no-audio --loop --input-ipc-server=/tmp/mpvsocket' ALL /home/styv/Vídeos/fondo_768.mp4")
    hl.exec_cmd(
        "mpvpaper -o 'no-audio --loop --input-ipc-server=/tmp/mpvsocket --hwdec=auto --profile=high-quality' ALL /home/styv/Vídeos/fondo_768.mp4")



    hl.exec_cmd("gnome-keyring-daemon --start --components=pkcs11,secrets,ssh")
    hl.exec_cmd("dbus-update-activation-environment --systemd --all")

    -- Start daemon on login
    hl.exec_cmd("snappy-switcher --daemon")

    -- Barrita
    hl.exec_cmd("/home/styv/work/RustProjects/barrita/target/release/barrita")

    -- Filtro para luz azul
    -- hl.exec_cmd("hyprsunset")
    hl.exec_cmd("hyprsunset -t 3950")
end)
