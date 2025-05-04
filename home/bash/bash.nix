{...}:
{
  programs.bash = {
    enable = true;
    historyControl = ["ignoreboth"];
    historyFileSize = 20000;
    historySize = 10000;
    historyIgnore = [
      "ls"
      "cd"
      "exit"
      "poweroff"
      "shutdown"
    ];
    shellAliases = {
      # nvim
      "v"  = "nvim";
      "vd" = "nvim -d";

      # git
      "gl"  =  "git log --graph --all --pretty=format:\"%C(magenta)%h %C(white) %an  %ar%C(blue)  %D%n%s%n\"";
      "gs"  =  "git status";
      "gd"  =  "git diff";
      "gh"  =  "git show HEAD";
      "gg"  =  "git pull --rebase";
      "gb"  =  "git rev-parse --symbolic-full-name --abbrev-ref HEAD";
      "gbu" = "git branch --set-upstream-to=origin/$(gb) $(gb)";

      # yazi
      "y" = "yazi";

      # ls
      "lss" = "ls -la --sort=time";

      # python
      "pysource" = "source venv/bin/activate 2>/dev/null || source .venv/bin/activate";

      # kubernetes
      "k"    = "kubectl";
      "kuse" = "kubectl config use-context";
    };
    initExtra = (builtins.readFile ./gwt) + (builtins.readFile ./nvm) + ''
      command -v helm &>/dev/null && eval "$(helm completion bash)"
      command -v kubectl &>/dev/null && eval "$(kubectl completion bash)"
    '';
  };
}
