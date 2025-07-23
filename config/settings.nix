{
  pkgs,
  config,
  lib,
  ...
}:
{
  config = {
    extraConfigLuaPre = ''
      function bool2str(bool) return bool and "on" or "off" end

      vim.fn.sign_define("diagnosticsignerror", { text = " ", texthl = "diagnosticerror", linehl = "", numhl = "" })
      vim.fn.sign_define("diagnosticsignwarn", { text = " ", texthl = "diagnosticwarn", linehl = "", numhl = "" })
      vim.fn.sign_define("diagnosticsignhint", { text = "󰌵", texthl = "diagnostichint", linehl = "", numhl = "" })
      vim.fn.sign_define("diagnosticsigninfo", { text = " ", texthl = "diagnosticinfo", linehl = "", numhl = "" })
    '';

    luaLoader.enable = true;
    clipboard = {
      # Use system clipboard
      register = "unnamedplus";

      providers = {
        wl-copy = lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
          enable = true;
          package = pkgs.wl-clipboard;
        };
      };
    };

    globals = {
      # Disable useless providers
      loaded_ruby_provider = 0; # Ruby
      loaded_perl_provider = 0; # Perl
      loaded_python_provider = 0; # Python 2

      # Custom for toggles
      disable_diagnostics = false;
      disable_autoformat = false;
      spell_enabled = true;
      colorizing_enabled = false;
      first_buffer_opened = false;
      whitespace_character_enabled = false;

    };

    opts = {
      # ────────────── General ──────────────
      hidden = true; # Keep closed buffer open in the background
      autowrite = true; # Enable auto write
      confirm = true; # Confirm to save changes before exiting modified buffer
      updatetime = 100; # Faster completion
      fileencoding = "utf-8"; # File-content encoding for the current buffer
      modeline = true; # Tags such as 'vim:ft=sh'
      modelines = 100; # Sets the type of modelines
      swapfile = false; # Disable the swap file
      undofile = true; # Automatically save and restore undo history
      autoread = true;
      title = true;

      # ────────────── Mouse & Clipboard ──────────────
      mouse = "a"; # Enable mouse control
      mousemodel = "extend"; # Mouse right-click extends the current selection

      # ────────────── Line Numbers & Cursor ──────────────
      number = true; # Display the absolute line number of the current line
      relativenumber = false; # Relative line numbers
      cursorline = true; # Highlight the screen line of the cursor
      cursorcolumn = false; # Highlight the screen column of the cursor

      # ────────────── Split Behavior ──────────────
      splitbelow = true; # A new window is put below the current one
      splitright = true; # A new window is put right of the current one
      splitkeep = "screen";

      # ────────────── Display / UI ──────────────
      wrap = false; # Prevent text from wrapping
      signcolumn = "yes"; # Whether to show the signcolumn
      colorcolumn = "100"; # Columns to highlight
      showmode = false;
      showtabline = 2;
      laststatus = 3; # When to use a status line for the last window
      termguicolors = true; # Enables 24-bit RGB color in the |TUI|
      conceallevel = 2; # Hide * markup for bold and italic, but not markers with substitutions
      list = true; # Show some invisible characters (tabs...
      scrolloff = 4; # Lines of context
      sidescrolloff = 8; # Columns of context
      ruler = false; # Disable the default ruler
      statuscolumn.__raw = "[[%!v:lua.require'snacks.statuscolumn'.get()]]";
      synmaxcol = 240; # Max column for syntax highlight
      showmatch = true; # when closing a bracket, briefly flash the matching one
      matchtime = 1; # duration of that flashing n deci-seconds
      startofline = true; # motions like "G" also move to the first char

      # ────────────── Completion ──────────────
      completeopt = lib.mkIf (!config.plugins.blink-cmp.enable) [
        "fuzzy"
        "menuone"
        "noselect"
        "popup"
      ]; # Command-line completion mode
      pumheight = 10;
      pumblend = 10;

      # ────────────── Search ──────────────
      incsearch = true; # Incremental search: show match for partly typed search command
      ignorecase = true; # When the search query is lower-case, match both lower and upper-case patterns
      smartcase = true; # Override the 'ignorecase' option if the search pattern contains upper case characters
      inccommand = "nosplit"; # preview incremental substitute
      grepformat = "%f:%l:%c:%m";
      grepprg = "rg --vimgrep";
      jumpoptions = "view";

      # ────────────── Messages ──────────────
      shortmess = "ltToOCFWIc"; # LazyVim does some append magic, I just copied the default and added WIcC
      report = 9001; # disable "x more/fewer lines" messages

      # ────────────── Indentation / Tabs ──────────────
      tabstop = 2; # Number of spaces a <Tab> in the text stands for (local to buffer)
      shiftwidth = 2; # Number of spaces used for each step of (auto)indent (local to buffer)
      softtabstop = 0; # If non-zero, number of spaces to insert for a <Tab> (local to buffer)
      expandtab = true; # Expand <Tab> to spaces in Insert mode (local to buffer)
      autoindent = true; # Do clever autoindenting
      smartindent = true; # Insert indents automatically
      copyindent = true;
      preserveindent = true;
      shiftround = true; # Round indent
      breakindent = true;
      linebreak = true;
      textwidth = 0; # Maximum width of text being inserted (0 = don't break lines)

      # ────────────── Formatting ──────────────
      formatoptions = "jcroqlnt"; # tcqj (i trust u lazyvim)

      # ────────────── Folding ──────────────
      foldmethod = "expr";
      foldexpr = # Lua
        ''
          function foldexpr()
            local buf = vim.api.nvim_get_current_buf()
            if vim.b[buf].ts_folds == nil then
              -- as long as we don't have a filetype, don't bother
              -- checking if treesitter is available (it won't)
              if vim.bo[buf].filetype == "" then
                return "0"
              end
              if vim.bo[buf].filetype:find("dashboard") then
                vim.b[buf].ts_folds = false
              else
                vim.b[buf].ts_folds = pcall(vim.treesitter.get_parser, buf)
              end
            end
            return vim.b[buf].ts_folds and vim.treesitter.foldexpr() or "0"
          end
        ''; # LazyVim uses its own function but this should do the exact same thing
      foldtext = "";
      foldlevel = 99; # Folds with a level higher than this number will be closed
      foldlevelstart = -1;
      foldenable = true;
      foldcolumn = "1";
      fillchars = {
        horiz = "━";
        horizup = "┻";
        horizdown = "┳";
        vert = "┃";
        vertleft = "┫";
        vertright = "┣";
        verthoriz = "╋";
        eob = " ";
        diff = "╱";
        fold = " ";
        foldopen = "";
        foldclose = "";
        msgsep = "‾";
      };

      # ────────────── Session ──────────────
      sessionoptions = [
        "buffers"
        "curdir"
        "tabpages"
        "winsize"
        "help"
        "globals"
        "skiprtp"
        "folds"
      ];

      # ────────────── Spellcheck ──────────────
      spell = true; # Highlight spelling mistakes (local to window)
      spelllang = [
        "en"
        "pl"
      ]; # Spell check languages

      # ────────────── Experimental / FIXME ──────────────
      lazyredraw = false; # Faster scrolling if enabled, breaks noice
      # FIXME: double floating windows?
      # winborder = "rounded"; # Border style for floating windows
    };
  };
}
