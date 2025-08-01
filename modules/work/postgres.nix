{ config, pkgs, ... }: {

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
      listen_addresses = "*";
    };
  };

  networking.firewall.allowedTCPPorts = [ 5432 ];

  environment.systemPackages = with pkgs; [
    pgbackrest
    pgloader 
    pgcopydb 
  ];

}
