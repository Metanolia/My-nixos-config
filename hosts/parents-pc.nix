{ config, pkgs, ... }:

{
# imports = [ ./hardware-parents-pc.nix ];
  
  boot.loader.systemd-boot.enable = true;
  networking.networkManager.enable = true;
  time.timeZone = "Europe/Moscow";

  environment.systemPackages = with pkgs; [
firefox
rustdesk-flutter
onlyoffice-bin
vlc
fastfetch
  ];
    services.xserver.enable = true;
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;
    
    nix.settings.auto-optimise-store = true;

}
