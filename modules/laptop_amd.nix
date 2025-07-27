{ config, pkgs, chaotic, ... }: {

  boot.kernelParams = ["quiet" "amd_pstate=active" "amdgpu.ppfeaturemask=0xffffffff"];

  powerManagement.enable = true;

  services = {
    power-profiles-daemon.enable = false;

    logind = {
      lidSwitch = "suspend";
      lidSwitchExternalPower = "suspend";
      lidSwitchDocked = "ignore";
    };

    tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
        PLATFORM_PROFILE_ON_AC = "performance";
        PLATFORM_PROFILE_ON_BAT = "balanced";
        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 0;
        AMDGPU_ABM_LEVEL_ON_AC = 0;
        AMDGPU_ABM_LEVEL_ON_BAT = 0;
        STOP_CHARGE_THRESH_BAT0 = 85;
        USB_AUTOSUSPEND = 0;
        RUNTIME_PM_DRIVER_DENYLIST = "mei_me";
      };
    };

    asusd.enable = true;
    supergfxd.enable = true;
  };

  environment.systemPackages = with pkgs; [
    supergfxctl
    asusctl
    linuxKernel.packages.linux_zen.cpupower
  ];
}
