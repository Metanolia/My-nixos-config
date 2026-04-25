{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./hosts/my-laptop.nix
    ];

  system.stateVersion = "25.11";

}
