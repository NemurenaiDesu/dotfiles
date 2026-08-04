{ lib, ... }:

let
  monitors = {
    central = "DP-1";
    left = "HDMI-A-1";
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
          (lib.generators.mkLuaInline ''{ output = "${monitors.central}", mode = "1920x1080@144", position = "0x0", scale = "1" }'')
        ];
      }
      {
        _args = [
          (lib.generators.mkLuaInline ''{ output = "${monitors.left}", mode = "1920x1080@144", position = "-1920x0", scale = "1" }'')
        ];
      }
    ];

    on = {
      _args = [
        "hyprland.start"
        (lib.generators.mkLuaInline ''
          function() 
            hl.exec_cmd("uwsm app -- openrgb --startminimized --profile default") 
          end
        '')
      ];
    };
  };
}
