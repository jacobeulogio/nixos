{
  config,
  pkgs,
  lib,
  ...
}:
{

  # Postgres
  services.postgresql = {
    enable = true;
    ensureDatabases = [ "analytics" ];
    package = pkgs.postgresql_17;
    enableTCPIP = true;
    extensions = with pkgs; [
      postgresql17Packages.tds_fdw
      postgresql17Packages.pg_cron
      postgresql17Packages.pg_partman
      postgresql17Packages.pgddl
    ];

    authentication = pkgs.lib.mkOverride 10 ''
      # type database     DBuser  address            auth-method
      local  all          all                        trust
      local  replication  all                        peer
      host   all          all     127.0.0.1/32       scram-sha-256
      host   all          eulogio 192.168.0.0/16     scram-sha-256
      host   all          mark    192.168.181.72/24  scram-sha-256
      host   all          all     176.16.16.19/24    scram-sha-256
      host   all          all     ::1/128            scram-sha-256

      # Allow Docker Container Access
      host   all          all     172.18.0.0/16      scram-sha-256
      host   all          all     172.19.0.0/16      scram-sha-256
    '';

    settings = {
      listen_addresses = lib.mkForce "*";
      # archive_mode = lib.mkDefault "on";
      # archive_command = lib.mkDefault "${lib.getExe pkgs.pgbackrest} --stanza=main archive-push %p";
      # max_wal_senders = "3";
      #
      # wal_level = "replica";
      # max_wal_size = "1GB";
      # min_wal_size = "80MB";

      # logging_collector = "true";
    };

    initdbArgs = [ "--allow-group-access" ];

  };

  # Allow port 5432
  networking.firewall.allowedTCPPorts = [ 5432 ];

  # pgbackrest
  # services.pgbackrest = {
  #   enable = true;
  #
  #   repos = {
  #     localhost.path = "/var/lib/pgbackrest";
  #   };
  #
  #   settings = {
  #     repo1-path = "/var/lib/pgbackrest";
  #     repo1-retention-full = "2";
  #   };
  #
  #   stanzas.main = {
  #     settings.cmd = lib.getExe pkgs.pgbackrest;
  #     instances.localhost = {
  #       path = config.services.postgresql.dataDir;
  #       user = "postgres";
  #     };
  #   };
  # };
  #
  # users.users.pgbackrest.extraGroups = [ "postgres" ];
  # users.groups.pgbackrest.members = [ "postgres" ];
  #
  # systemd.tmpfiles.rules = [
  #   "d /var/log/pgbackrest 0700 postgres postgres -"
  #   "d /var/spool/pgbackrest 0700 postgres postgres -"
  #   "d /var/lib/pgbackrest 0700 postgres postgres -"
  #   "f /var/lib/pgbackrest/backup 0700 postgres postgres -"
  #   "d /var/lib/postgresql/17/global 0700 postgres postgres -"
  #   "f /tmp/pgbackrest/all.stop 0700 postgres postgres -"
  # ];
  #
  environment.systemPackages = with pkgs; [
    pgbackrest
    pgloader
    pgcopydb
  ];

}
