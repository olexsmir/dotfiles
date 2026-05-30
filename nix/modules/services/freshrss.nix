{ config, pkgs, ... }: {
  age.secrets.freshrss-olex = {
    file = ../../secrets/freshrss-olex.age;
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
        version = "unstable-2026-05-30";
        src = pkgs.fetchFromGitHub {
          owner = "FreshRSS";
          repo = "Extensions";
          rev = "8f48feec3a849a842dd99884b2a3c14f19410941";
          hash = "sha256-F4xQ0S+K1LFo/tOftThbURSU4amZDdD1HrHBEfUsaOE=";
        };
        installPhase = ''
          mkdir -p $out/share/freshrss/extensions
          cp -r xExtension-* $out/share/freshrss/extensions/
        '';
      })
    ];
  };
}
