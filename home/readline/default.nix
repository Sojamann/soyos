{ ... }: {

  programs.readline.enable = true;
  
  # for options see: https://www.gnu.org/software/bash/manual/html_node/Readline-Init-File-Syntax.html
  programs.readline.variables = {
    editing-mode = "vi";
    show-mode-in-prompt = true;
  };
  programs.readline.extraConfig = ''
    set vi-cmd-mode-string \1\e[1;36m\2n) \1\e[0m\2
    set vi-ins-mode-string \1\e[1;36m\2i) \1\e[0m\2
  '';
}
