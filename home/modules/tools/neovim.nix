{ pkgs, lib, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    extraLuaConfig = ''
      require("config.lazy")
    '';
  };

  # Needed dependencies for LazyVim
  home.packages = with pkgs; [
    # --- Core tools ---
    gcc # C compiler (needed for Treesitter $ native C plugins)
    gnumake # Build too (needed to compile plugin extensions like fzf)
    unzip # Zip extractor (needed for extracting plugin archives)
    git # Version control (needed to download plugins)
    ripgrep # Fast text search tool
    fd # Fast file search tool
    tree-sitter # Syntax parser CLI (needed for advanced highlighting and navigation)

    # --- Go ---
    gopls # Go LSP
    gofumpt # Go formatter
    golangci-lint # Go linter

    # --- Nix ---
    nil # LSP for Nix
    statix # Nix Linter
    nixfmt-rfc-style # Nix formatter

    # --- Java ---
    jdt-language-server # Java LSP

    # --- Frontend ---
    vtsls # JS/TS LSP
    astro-language-server # Astro LSP
    tailwindcss-language-server # Tailwind autocompletion
    vscode-langservers-extracted # HTML, CSS & JSON LSPs

    # --- Lua ---
    lua-language-server # Lua LSP
    stylua # Lua formatter

    # --- Bash / Scripting ---
    bash-language-server # Bash/Shell LSP
    shfmt # Shell formatter
  ];

  # Download LazyVim starter directly if lazy.lua is missing
  home.activation.setupLazyVim = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ ! -f "$HOME/.config/nvim/lua/config/lazy.lua" ]; then
      # Temporary backup of user plugins injected by HM if any
      mkdir -p /tmp/nvim-backup
      [ -d "$HOME/.config/nvim/lua/plugins" ] && cp -r $HOME/.config/nvim/lua/plugins/* /tmp/nvim-backup/ 2>/dev/null || true

      rm -rf $HOME/.config/nvim
      ${pkgs.git}/bin/git clone https://github.com/LazyVim/starter $HOME/.config/nvim
      rm -rf $HOME/.config/nvim/.git

      # Restore HM plugins
      if [ -d "/tmp/nvim-backup" ]; then
        mkdir -p $HOME/.config/nvim/lua/plugins
        cp -r /tmp/nvim-backup/* $HOME/.config/nvim/lua/plugins/ 2>/dev/null || true
        rm -rf /tmp/nvim-backup
      fi
    fi
  '';

  # Disable Mason auto-install so LazyVim uses System (Nix) LSPs natively
  home.file.".config/nvim/lua/plugins/nix-mason.lua".text = ''
    return {
      { "mason-org/mason.nvim", enabled = false },
      { "mason-org/mason-lspconfig.nvim", enabled = false },
    }
  '';
}
