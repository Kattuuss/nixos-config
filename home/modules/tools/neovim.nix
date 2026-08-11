{ pkgs, lib, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  # Needed dependencies for LazyVim
  home.packages = with pkgs; [
    # --- Core tools ---
    gcc
    gnumake
    unzip
    git
    ripgrep
    fd
    tree-sitter

    # --- Go ---
    gopls                         # Go LSP
    gofumpt                       # Go formatter
    golangci-lint                 # Go linter

    # --- Nix ---
    nil                           # LSP for Nix
    statix                        # Nix Linter
    nixfmt                        # Nix formatter

    # --- Java ---
    jdt-language-server           # Java LSP

    # --- Frontend ---
    vtsls                         # JS/TS LSP
    astro-language-server         # Astro LSP
    tailwindcss-language-server      # Tailwind autocompletion
    vscode-langservers-extracted  # HTML, CSS & JSON LSPs

    # --- Lua ---
    lua-language-server
    stylua

    # --- Bash / Scripting ---
    bash-language-server
    shfmt                         # Shell formatter
  ];

  # Download LazyVim the first time in ~/.config/nvim (it remains editable)
  home.activation.setupLazyVim = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ ! -f "$HOME/.config/nvim/lua/config/lazy.lua" ]; then
      rm -rf $HOME/.config/nvim
      ${pkgs.git}/bin/git clone https://github.com/LazyVim/starter $HOME/.config/nvim
      rm -rf $HOME/.config/nvim/.git
    fi
  '';
}
