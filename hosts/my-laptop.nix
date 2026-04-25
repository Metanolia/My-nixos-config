{ config, pkgs, ... }:

{
  imports = [
    ./hardware-my-laptop.nix
  ];

# BOOT

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


# NETWORK

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall.enable = true;
    firewall.checkReversePath = "loose";
  };


# TIME / LOCALE

  time.timeZone = "Europe/Moscow";

  i18n = {
    defaultLocale = "ru_RU.UTF-8";

    extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };
};
 


# DESKTOP (KDE PLASMA 6)
  
  services.xserver.enable = false;
  
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.printing.enable = true;
 
 
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde ];
  };


# SOUND

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };


# BLUETOOTH
  
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };


# SECURITY

  security.apparmor.enable = true;
  
  services.tailscale.enable = true;


# VIRTUALISATION / ISOLATION

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };


# USERS

  users.users.meta = {
    isNormalUser = true;
    description = "Meta";
 
  shell = pkgs.fish;

  extraGroups = [
    "wheel"
    "networkmanager"
    "podman"
 ];

 packages = with pkgs; [
   kdePackages.kate
 ];
};

programs.fish.enable = true;


# PACKAGES (SYSTEM-WIDE)

environment.systemPackages = with pkgs; [
  # core utils
  git wget curl unzip htop btop fastfetch

  # terminal tooling
  fish starship zoxide eza bat ripgrep fd gitui helix

  # dev 
  vscode python3 python3Packages.pip pyenv direnv nix-direnv

  # apps
  telegram-desktop vlc qbittorrent thunderbird foliate libreoffice-fresh

  # browser 
  google-chrome

  # desktop tools
  blueman appimage-run github-desktop

  # containers / remote
  distrobox rustdesk-flutter syncthing

  # filesystems
  exfatprogs

];


# PROGRAMS

programs = {
   firefox.enable = true;
   steam.enable = true;

   gamemode.enable = true;

   direnv = {
     enable = true;
     nix-direnv.enable = true;
   };
};



# NIX SETTINGS

nix = {
  settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };

  gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 3d";
  };

};

nixpkgs.config.allowUnfree = true;

# SYSTEM VERSION

system.stateVersion = "25.11";


}
