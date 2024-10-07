{...}:
{
  programs.bash = {
    enable = true;
    historyControl = ["ignoreboth"];
    historyFileSize = 20000;
    historySize = 10000;
    shellAliases = {
      # nvim
      "v"  = "nvim";
      "vd" = "nvim -d";

      # yazi
      "ya" = "yazi";

      # git
      "gl"  =  "git log";
      "gs"  =  "git status";
      "gd"  =  "git diff";
      "gh"  =  "git show HEAD";
      "gg"  =  "git pull --rebase";
      "gb"  =  "git rev-parse --symbolic-full-name --abbrev-ref HEAD";
      "gbu" = "git branch --set-upstream-to=origin/$(gb) $(gb)";
      # ls
      "lss" = "ls -la --sort=time";
      # python
      "pysource" = "source ./venv/bin/activate";
      # kubernetes
      "k"    = "kubectl";
      "kuse" = "kubectl config use-context";
    };
    initExtra = ''
      type -P helm &>/dev/null && eval "$(helm completion bash)"
      type -P kubectl &>/dev/null && eval "$(kubectl completion bash)"
    '';
  };
}
