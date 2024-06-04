FROM gitpod/workspace-full

RUN sudo apt-get update && \
      curl -L https://nixos.org/nix/install | sh -- /dev/stdin --no-daemon --yes && \
      . ~/.nix-profile/etc/profile.d/nix.sh && \
      nix-env -iA devenv -f https://github.com/NixOS/nixpkgs/tarball/nixpkgs-unstable && \
      sudo apt-get install direnv -y && \
      echo 'eval "$(direnv hook bash)"' >> ~/.bashrc && \
      echo 'eval "$(direnv hook zsh)"' >> ~/.zshrc && \
      mkdir -p ~/.config/fish && \
      echo 'direnv hook fish | source' >> ~/.config/fish/config.fish && \
      mkdir -p ~/.config/direnv
