{ config, lib, ... }:

let
  monitors = {
    central = "eDP-1";
  };
in
{
  _module.args.monitors = monitors;

  wayland.windowManager.hyprland.settings = {
    monitor = [
      {
        _args = [
          (lib.generators.mkLuaInline ''{ output = "", mode = "preferred@auto", position = "0x0", scale = "1" }'')
        ];
      }
      {
        _args = [
          (lib.generators.mkLuaInline ''{ output = "${monitors.central}", mode = "2560x1600@60", position = "0x0", scale = "1.6" }'')
        ];
      }
    ];

    on = {
      _args = [
        "hyprland.start"
        (lib.generators.mkLuaInline ''
          function() 
            hl.exec_cmd("uwsm app -t service -u app-battery-notifier.service -p Restart=always -- ${config.xdg.dataHome}/bin/battery-notifier 20 /sys/class/power_supply/BATT") 
          end
        '')
      ];
    };
  };
}
