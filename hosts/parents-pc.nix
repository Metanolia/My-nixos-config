{ config, pkgs, ... }:

{ imports = [ ./hardware-parents-pc.nix ];
  
  boot.loader.systemd-boot.enable = true;
  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Moscow";

  environment.systemPackages = with pkgs; [
firefox
rustdesk-flutter
onlyoffice-bin
vlc
fastfetch

  services.displayManager.sddm.enable = true;
    services.desktopManager.plazma6.enable = true;
    
    nix.settings.auto-optimise-store = true;

}
