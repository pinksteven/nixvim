{ config, lib, ... }:
{
  config = {
    extraConfigLuaPre = ''
      vim.fn.sign_define("diagnosticsignerror", { text = " ", texthl = "diagnosticerror", linehl = "", numhl = "" })
      vim.fn.sign_define("diagnosticsignwarn", { text = " ", texthl = "diagnosticwarn", linehl = "", numhl = "" })
      vim.fn.sign_define("diagnosticsignhint", { text = "󰌵", texthl = "diagnostichint", linehl = "", numhl = "" })
      vim.fn.sign_define("diagnosticsigninfo", { text = " ", texthl = "diagnosticinfo", linehl = "", numhl = "" })
    '';

    luaLoader.enable = true;
    clipboard.providers.wl-copy.enable = true;

    # Options stolen form LazyVim
    opts = {
      autowrite = true; # Enable auto write
      completeopt = [
        "menu"
        "menuone"
        "noselect"
      ];
      conceallevel = 2; # Hide * markup for bold and italic, but not markers with substitutions
      confirm = true; # Confirm to save changes before exiting modified buffer
      cursorline = true; # Enable highlighting of the current line
      expandtab = true; # Use spaces instead of tabs
      fillchars = {
        foldopen = "";
        foldclose = "";
        fold = " ";
        foldsep = " ";
        diff = "╱";
        eob = " ";
      };
      foldlevel = 99;
      # LazyVim uses it's own function but this should do the exact same thing
      formatexpr = lib.mkIf config.plugins.conform-nvim.enable "require('conform').formatexpr()";
      formatoptions = "jcroqlnt"; # tcqj (i trust u lazyvim)
      grepformat = "%f:%l:%c:%m";
      grepprg = "rg --vimgrep";
      ignorecase = true; # Ignore case
      inccommand = "nosplit"; # preview incremental substitute
      jumpoptions = "view";
      laststatus = 3; # global statusline
      linebreak = true; # Wrap lines at convenient points
      list = true; # Show some invisible characters (tabs...
      mouse = "a"; # Enable mouse mode
      number = true; # Print line number
      pumblend = 10; # Popup blend
      pumheight = 10; # Maximum number of entries in a popup
      relativenumber = false; # A lot of ppl use this, i despise it, idk why but i hate it
      ruler = false; # Disable the default ruler
      scrolloff = 4; # Lines of context
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
      shiftround = true; # Round indent
      shiftwidth = 2; # Size of an indent
      shortmess = "ltToOCFWIcC"; # LazyVim does some append magic i just copied the default and added WIcC
      showmode = false; # Dont show mode since we have a statusline
      sidescrolloff = 8; # Columns of context
      signcolumn = "yes"; # Always show the signcolumn, otherwise it would shift the text each time
      smartcase = true; # Don't ignore case with capitals
      smartindent = true; # Insert indents automatically
      spelllang = [
        "en"
        "pl"
      ];
      splitbelow = true; # Put new windows below current
      splitkeep = "screen";
      splitright = true; # Put new windows right of current
      statuscolumn.__raw = "[[%!v:lua.require'snacks.statuscolumn'.get()]]";
      tabstop = 2; # Number of spaces tabs count for
      termguicolors = true; # True color support
      undofile = true;
      undolevels = 10000;
      updatetime = 200; # Save swap file and trigger CursorHold
      virtualedit = "block"; # Allow cursor to move where there is no text in visual block mode
      wildmode = [
        "longest:full"
        "full"
      ]; # Command-line completion mode
      winminwidth = 5; # Minimum window width
      wrap = false; # Disable line wrap
      smoothscroll = true;
      foldmethod = "expr";
      foldtext = "";
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
        '';
    };
  };
}
