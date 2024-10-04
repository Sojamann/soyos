{ pkgs, ... }: {
  xdg.configFile."lf/icons".source = ./icons;

  programs.lf = {
    enable = true;

    # commands which can be used in bindings
    commands = {
      unpack = ''
        ''${{
        #${pkgs.bash}/bin/bash
        dest="$(basename "$f")"
        dest="''${dest%.*}"
        read -rp "to where? default ($dest): " ans
        if [[ -n "$ans" ]]; then
          dest="$ans"
        fi

        mkdir -p "$dest"
        case "$f" in
          *.zip) unzip "$f" -d "$dest" ;;
          *.tar.gz|*.tar|*.tgz) tar -xvf "$f" -C "$dest" ;;
          *) echo "Unsupported format" ;;
        esac
      }}
      '';
    };

    keybindings = {
      # instead of the normal "open" everthing is opened
      # in nvim ($EDITOR)
      "<enter>" = ''''$${pkgs.neovim}/bin/nvim "$f"'';
      # preview
      P = ''''$${pkgs.bat}/bin/bat --paging=always "$f"'';
      # unpack
      u = "unpack";

      d = "cut";
      p = "paste";
      y = "copy";
    };

    settings = {
      preview = true;
      hidden = true;
      drawbox = true;
      icons = true;
      ignorecase = true;
    };

    extraConfig = 
    let
      previewer = 
        pkgs.writeShellScriptBin "pv.sh" ''
        file="$1"
        if [[ "$( ${pkgs.file}/bin/file -Lb --mime-type "$file")" =~ ^image ]]; then
            ${pkgs.kitty}/bin/kitty +kitten icat --silent --stdin no --transfer-mode file --place "''${w}x''${h}@''${x}x''${y}" "$file" < /dev/null > /dev/tty
            exit 1
        fi
        ${pkgs.pistol}/bin/pistol "$file"
      '';
    in
    ''
    set previewer ${previewer}/bin/pv.sh
    '';
  };

  home.packages = with pkgs; [
    bat
    file
    kitty
    pistol
    unzip
  ];
}
