{
  config,
  pkgs,
  chaotic,
  ...
}: {
  boot.kernelParams = ["quiet" "amd_pstate=active" "amdgpu.ppfeaturemask=0xfff7bfff"];

  powerManagement.enable = true;
  services.power-profiles-daemon.enable = false;

  services.logind.lidSwitch = "suspend";
  services.logind.lidSwitchExternalPower = "lock";
  services.logind.lidSwitchDocked = "ignore";

  services.tlp = {
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
      AMDGPU_ABM_LEVEL_ON_BAT = 3;
      STOP_CHARGE_THRESH_BAT0 = 85;
      USB_AUTOSUSPEND = 0;
      RUNTIME_PM_DRIVER_DENYLIST = "mei_me";
    };
  };

  services.asusd.enable = true;
  services.supergfxd.enable = true;

  environment.systemPackages = with pkgs; [
    supergfxctl
    asusctl
  ];
}
