{
  autoGroups = {
    highlight_yank = { };
    vim_enter = { };
    indentscope = { };
    restore_cursor = { };
  };

  autoCmd = [
    # highlight Text on Yank
    {
      group = "highlight_yank";
      event = "TextYankPost";
      pattern = "*";
      callback = {
        __raw = "
        function()
          vim.highlight.on_yank()
        end
      ";
      };
    }
    {
      group = "indentscope";
      event = [ "FileType" ];
      pattern = [
        "help"
        "Startup"
        "startup"
        "neo-tree"
        "Trouble"
        "trouble"
        "notify"
      ];
      callback = {
        __raw = ''
          function()
            vim.b.miniindentscope_disable = true
          end
        '';
      };
    }
    # from NVChad https://nvchad.com/docs/recipes (this autocmd will restore the cursor position when opening a file)
    {
      group = "restore_cursor";
      event = [ "BufReadPost" ];
      pattern = "*";
      callback = {
        __raw = ''
          function()
            if
              vim.fn.line "'\"" > 1
              and vim.fn.line "'\"" <= vim.fn.line "$"
              and vim.bo.filetype ~= "commit"
              and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
            then
              vim.cmd "normal! g`\""
            end
          end
        '';
      };
    }
    # Reload neo-tree when leaving any terminal job
    {
      event = "TermLeave";
      callback.__raw = ''
        function()
          require("neo-tree.sources.filesystem.commands").refresh(
            require("neo-tree.sources.manager").get_state("filesystem")
          )
        end
      '';
    }
    # Don't show bufferline in startup
    {
      event = "FileType";
      pattern = [ "startup" ];
      command = "set showtabline=0";
    }
    # Tile neovim on entering and float on exit
    {
      event = "UIEnter";
      command = ''silent !hyprctl dispatch settiled --quiet'';
      once = true;
    }
    {
      event = "VimLeavePre";
      command = ''silent !hyprctl dispatch setfloating --quiet'';
    }
  ];
}
