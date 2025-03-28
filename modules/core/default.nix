{ config, pkgs, inputs, ...}:

{
  imports = [
    ./alacritty.nix          
  ]

  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;


}
