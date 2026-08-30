{ pkgs, ... }:

{
  imports = [
    ./hardware.nix
  ];

  boot.kernelParams = [
    "i915.fastboot=1"
    "rtc_cmos.use_acpi_alarm=1"
  ];

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.timeout = 0;

  hardware.cpu.intel.updateMicrocode = true;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  hardware.bluetooth.disabledPlugins = [ "PowerManager" ];

  hardware.firmware = [ pkgs.linux-firmware ];

  services.system76-scheduler.enable = true;
  services.system76-scheduler.settings.cfsProfiles.enable = true;
  
  services.tlp = {
    enable = true;
    settings = {
      CPU_BOOST_ON_AC = 1;
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";
    };
  };
}
