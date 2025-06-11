{
  config,
  pkgs,
  ...
}: {
  boot.kernelParams = ["quiet" "amd_pstate=active"];

  powerManagement.enable = true;
  services.power-profiles-daemon.enable = false;

  services.logind.lidSwitch = "suspend";
  services.logind.lidSwitchExternalPower = "lock";
  services.logind.lidSwitchDocked = "ignore";

  services.tlp = {
    enable = true;
    settings = {
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";

      PLATFORM_PROFILE_ON_AC = "performance";
      PLATFORM_PROFILE_ON_BAT = "low-power";

      AMDGPU_ABM_LEVEL_ON_AC = 0;
      AMDGPU_ABM_LEVEL_ON_BAT = 3;

      STOP_CHARGE_THRESH_BAT0 = 85;
      USB_AUTOSUSPEND = 0;
    };
  };

  services.auto-epp = {
    enable = true;
    settings = {
      state.epp_state_for_AC = "performance";
      state.epp_state_for_BAT = "balance_power";
    };
  };

  services.asusd.enable = true;
  services.supergfxd.enable = true;

  environment.systemPackages = with pkgs; [
    supergfxctl
    asusctl
  ];
}
