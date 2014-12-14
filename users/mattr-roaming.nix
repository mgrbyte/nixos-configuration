{config, pkgs, ...}:
let
  common = import ../common.nix {
    inherit pkgs;
  };
  packageGroups = import ../package-groups.nix {
    inherit pkgs;
  };
in
common.misc // {

  require = [
     ../asus-x501a-laptop.nix
     ../netsight-vpn.nix
  ];
  
  
  environment = {
    systemPackages = with packageGroups; [
       desktop
       dev
       utils
    ];
  };

  fonts = {
    enableCoreFonts = true;
  };

  networking = {
    hostName = "nixos-lemuria";
    extraHosts = ''
    127.0.0.1 nixos-lemuria
    ::1       nixos-lemuria
    '';
    enableIPv6 = false;
    # networkmanager = {
    #   enable = true;
    # };
    wireless = {
      enable = true;
      interfaces = [ "wlp2s0" ];
      userControlled = {
        enable = true;
      };
    };
  };

  nixpkgs.config = common.config;

  powerManagement = {
    enable = true;
  };

  nix = common.nix;
  programs.bash = common.bash;
  programs.ssh.startAgent = false;
  services = common.services;
}
