{ pkgs, ...}: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    prefix = "C-Space";
    terminal = "screen-256color";
    mouse = true;
    keyMode = "vi";
    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
      urlview
      {
        plugin = catppuccin;
        extraConfig = ''
          set -g @catppuccin_window_left_separator ""
          set -g @catppuccin_window_right_separator " "
          set -g @catppuccin_window_middle_separator " █"
          set -g @catppuccin_window_number_position "right"

          set -g @catppuccin_window_default_fill "number"
          set -g @catppuccin_window_default_text "#W"

          set -g @catppuccin_window_current_fill "number"
          set -g @catppuccin_window_current_text "#W"

          set -g @catppuccin_status_modules_right "directory session"
          set -g @catppuccin_status_left_separator  " "
          set -g @catppuccin_status_right_separator ""
          set -g @catppuccin_status_right_separator_inverse "no"
          set -g @catppuccin_status_fill "icon"
          set -g @catppuccin_status_connect_separator "no"

          set -g @catppuccin_directory_text "#{pane_current_path}"
        '';
      }
    ];

    extraConfig = ''
      # Start index of window/pane with 1
      set -g base-index 1
      set -g pane-base-index 1
      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on

      set-option -ga terminal-overrides ",xterm-256color:Tc"

      # ==========================
      # ===    Key Mappings    ===
      # ==========================

      # Vim style pane selection
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # Use Alt-arrow keys without prefix key to switch panes
      bind -n M-Left select-pane -L
      bind -n M-Right select-pane -R
      bind -n M-Up select-pane -U
      bind -n M-Down select-pane -D

      # Shift arrow to switch windows
      bind -n S-Left  previous-window
      bind -n S-Right next-window

      # Copy Mode
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle

      # Sensible splits and new windows
      bind - split-window -v -c "#{pane_current_path}"
      bind | split-window -h -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"

      # Rename session and window
      bind r command-prompt -I "#{window_name}" "rename-window '%%'"
      bind R command-prompt -I "#{session_name}" "rename-session '%%'"

      # ==========================
      # ===       Popups       ===
      # ==========================

      # style
      set -g popup-border-style rounded

      # CTRL-s opens a scratch space
      bind C-s display-popup -E "bash #{pane_current_path}"

      # CTRL-o opens a repoitory in $HOME/Repos within a new session
      #
      # NOTE: couldn't get find with -exec basename to work...
      bind C-o display-popup -E "\
          find $HOME/Repos -maxdepth 1 -mindepth 1 | \
          xargs -L 1 basename | \
          fzf --reverse --header 'Open Repo' \
              --bind 'enter:execute-silent(tmux new-session -d -s {} -c $HOME/Repos/{})' \
          --bind 'enter:+execute-silent(tmux switch-client -t {})' \
          --bind 'enter:+accept' \
    "
    '';
  };
}
