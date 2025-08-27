{
  pkgs,
  lib,
  ...
}:
{

  # PostgreSQL Exporter
  services.prometheus.exporters.postgres = {
    enable = true;
    port = 9187;
    dataSourceName = "postgresql://postgres@localhost:5432/postgres?sslmode=disable";
  };

  # Prometheus Server
  services.prometheus = {
    enable = true;
    port = 9090;
    scrapeConfigs = [
      {
        job_name = "postgres";
        static_configs = [
          {
            targets = [ "localhost:9187" ];
          }
        ];
      }
      {
        job_name = "node";
        static_configs = [
          {
            targets = [ "localhost:9100" ];
          }
        ];
      }
    ];
  };

  # Node Exporter for system metrics
  services.prometheus.exporters.node = {
    enable = true;
    port = 9100;
  };

  # Grafana
  services.grafana = {
    enable = true;
    settings = {
      server = {
        http_port = 3000;
        http_addr = "0.0.0.0";
      };
      security = {
        admin_user = "admin";
        admin_password = "admin";
      };
    };
  };

  # Open firewall ports for monitoring services
  networking.firewall.allowedTCPPorts = [
    3000
    9090
    9100
    9187
  ];

}
