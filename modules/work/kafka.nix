{ config, pkgs, ... }: {

services.apache-kafka = {
    enable = true;
    clusterId = "IUR8GhdSRdayR11aJjdNMA";
    formatLogDirs = true;
    formatLogDirsIgnoreFormatted = true;
    settings = {
      listeners = [
        "PLAINTEXT://:9092"
        "CONTROLLER://:9093"
      ];
      # Adapt depending on your security constraints
      "listener.security.protocol.map" = [
        "PLAINTEXT:PLAINTEXT"
        "CONTROLLER:PLAINTEXT"
      ];
      "controller.quorum.voters" = [
        "1@127.0.0.1:9093"
      ];
      "controller.listener.names" = ["CONTROLLER"];
      "plugin.path" = "libs/connect-file-4.0.0.jar";
      "node.id" = 1;
      "process.roles" = ["broker" "controller"];

      "log.dirs" = ["/var/lib/apache-kafka"];
      "offsets.topic.replication.factor" = 1;
      "transaction.state.log.replication.factor" = 1;
      "transaction.state.log.min.isr" = 1;
    };
  };
  systemd.services.apache-kafka.unitConfig.StateDirectory = "apache-kafka";

  environment.systemPackages = with pkgs; [
    apacheKafka
    kafkactl
  ];

  networking.firewall.allowedTCPPorts = [9092];


}
