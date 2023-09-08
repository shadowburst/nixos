{ pkgs, ... }:

let
  theme = import ../../theme;
in
{
  home.packages = with pkgs; [
    eww-wayland
  ];

  xdg.configFile."eww" = {
    source = ./config;
    recursive = true;
  };

  xdg.configFile."eww/common/colors.scss".text = with theme; ''
    $foreground: ${colors.fg};
    $background: ${colors.bg};
    $card: ${colors.card};
    $primary: ${colors.primary};
    $secondary: ${colors.secondary};
    $success: ${colors.success};
    $warning: ${colors.warning};
    $danger: ${colors.danger};
    $disabled: ${colors.disabled};
    $colors: (
        foreground: $foreground,
        background: $background,
        card: $card,
        primary: $primary,
        secondary: $secondary,
        success: $success,
        warning: $warning,
        danger: $danger,
        disabled: $disabled,
        transparent: transparent,
    );
  '';

  xdg.configFile."eww/common/fonts.scss".text = with theme; ''
    $normal-font: "${fonts.normal}";
    $mono-font: "${fonts.mono}";
    $nerd-font: "${fonts.nerdMono}";
    $fonts: (
        normal: $normal-font,
        mono: $mono-font,
        nerd: $nerd-font,
    );
  '';
}
