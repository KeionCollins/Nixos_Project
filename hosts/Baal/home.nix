# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {

  imports = [
    ../../modules/core/default.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

    ];

    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "keion";
    homeDirectory = "/home/keion";
  };

  # home.packages = with pkgs; [ steam ];

  programs.home-manager.enable = true;
  programs.git.enable = true;
  programs.alacritty.enable = true;
 
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "23.05";
}
