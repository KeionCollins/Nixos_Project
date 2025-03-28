{ config, pkgs, inputs, ...}:

{
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./alacritty.nix          
  ];

  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;


}
