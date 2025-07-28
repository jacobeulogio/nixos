{ config, pkgs, ... }: {

  services.kafka = {
    enable = true;
    kraft.enable = true;
    dataDir = "/var/lib/kafka";
    listeners = [
      "PLAINTEXT://0.0.0.0:9092"
    ];
  };

  networking.firewall.allowedTCPPorts = [9092];

  environment.systemPackages = with pkgs; [
    apacheKafka
  ]
}
