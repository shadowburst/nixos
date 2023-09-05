{ pkgs, ... }:

let
  theme = import ../../theme;
in
{
  programs.eww = {
    enable = true;
    package = pkgs.eww-wayland;
    configDir = ./config;
  };

  # xdg.configFile = with theme; {
  #   "eww/common/colors.scss".text = ''
  #     $foreground: ${colors.fg}
  #     $background: ${colors.bg};
  #     $card: ${colors.card};
  #     $primary: ${colors.primary};
  #     $secondary: ${colors.secondary};
  #     $success: ${colors.success};
  #     $warning: ${colors.warning};
  #     $danger: ${colors.danger};
  #     $disabled: ${colors.disabled};
  #     $colors: (
  #         foreground: $foreground,
  #         background: $background,
  #         card: $card,
  #         primary: $primary,
  #         secondary: $secondary,
  #         success: $success,
  #         warning: $warning,
  #         danger: $danger,
  #         disabled: $disabled,
  #         transparent: transparent,
  #     );
  #   '';
  #   "eww/common/fonts.scss".text = ''
  #     $normal-font: "${fonts.normal}";
  #     $mono-font: "${fonts.mono}";
  #     $nerd-font: "${fonts.nerdMono}";
  #     $fonts: (
  #         normal: $normal-font,
  #         mono: $mono-font,
  #         nerd: $nerd-font,
  #     );
  #   '';
  # };
}
