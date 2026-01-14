{ config, pkgs, ... }:
{
  age.secrets.freshrss-olex = {
    file = ../secrets/freshrss-olex.age;
    owner = "freshrss";
    group = "freshrss";
  };

  services.freshrss = {
    enable = true;
    defaultUser = "olex";
    passwordFile = config.age.secrets.freshrss-olex.path;
    webserver = "caddy";
    virtualHost = "rss.olexsmir.xyz";
    baseUrl = "https://rss.olexsmir.xyz";
    extensions = [
      pkgs.freshrss-extensions.reddit-image
      (pkgs.stdenv.mkDerivation {
        pname = "freshrss-official-extensions";
        version = "unstable-2025-01-16";
        src = pkgs.fetchFromGitHub {
          owner = "FreshRSS";
          repo = "Extensions";
          rev = "3605f65b65e13ad818d4acbe337f7147feeb0970";
          hash = "sha256-1c0d0szF21JHm/Sw16iSLPik3HIv2xjxKmvuAkLKqM0=";
        };
        installPhase = ''
          mkdir -p $out/share/freshrss/extensions
          cp -r xExtension-* $out/share/freshrss/extensions/
        '';
      })
    ];
  };
}
