{ pkgs, ... }:

{
  home.packages = with pkgs; [
    opencode
    ripgrep

    # Core CLI — migrating from Homebrew
    gh
    fd
    tmux
    tree
    wget
    grpcurl
    docker-compose
    git
    nodejs
    cmake
    protobuf
    jdk17
  ];

  programs.home-manager.enable = true;
  programs.bash.enable = true;

  programs.fish = {
    enable = true;

    shellInit = ''
      set -g fish_greeting
      fish_add_path "$HOME/.local/bin"
    '';

    loginShellInit = ''
      if test -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish
        . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish
      end
    '';
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      command_timeout = 1000;
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };
    };
  };

  programs.yazi.enable = true;

  programs.atuin = {
    enable = true;
    settings = {
      dialect = "us";
      style = "compact";
      show_preview = false;
    };
  };
}
