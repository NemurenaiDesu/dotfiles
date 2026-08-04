hl.on("hyprland.start",
    function()
        hl.exec_cmd("echo $HYPRLAND_INSTANCE_SIGNATURE > /tmp/HYPRLAND_INSTANCE_SIGNATURE")

        hl.exec_cmd("systemctl --user start hyprpolkitagent")

        hl.exec_cmd("hyprlock --grace 0 --immediate-render --no-fade-in")


        hl.exec_cmd("uwsm app -- udiskie --automount --notify --smart-tray")
        hl.exec_cmd("uwsm app -- tailscale systray --theme dark:nobg")
        hl.exec_cmd("uwsm app -- copyq --start-server")


        hl.exec_cmd("uwsm app -- run-on-workspace 'special:hidden' 'nemo ~/.local/share/nemo' --silent")
        hl.exec_cmd("uwsm app -- run-on-workspace 'special:hidden' 'kitty --single-instance sh' --silent")

        hl.exec_cmd("uwsm app -- run-on-workspace '25' 'Telegram' --silent")
        hl.exec_cmd("uwsm app -- run-after-keyring run-on-workspace '21' 'vivaldi' --silent")

        hl.exec_cmd(
            "uwsm app -- run-after-keyring run-on-workspace 'special:aichat' 'chromium --app=https://chatgpt.com/' --silent"
        )
    end
)
