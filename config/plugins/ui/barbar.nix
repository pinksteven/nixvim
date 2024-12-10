{
  plugins.barbar = {
    enable = true;

    settings = {
      focus_on_close = "previous";

      sidebar_filetypes."neo-tree" = {
        align = "left";
        event = "BufWipeout";
      };
    };

    keymaps = {
      close = {
        key = "<A-q>";
        mode = "n";
        options = {
          silent = true;
          desc = "Close Buffer";
        };
      };
      closeAllButCurrentOrPinned = {
        key = "<A-Q>";
        mode = "n";
        options = {
          silent = true;
          desc = "Close all buffers but current";
        };
      };
      previous = {
        key = "<A-,>";
        mode = "n";
        options = {
          silent = true;
          desc = "Previous Buffer";
        };
      };
      next = {
        key = "<A-.>";
        mode = "n";
        options = {
          silent = true;
          desc = "Next Buffer";
        };
      };
      movePrevious = {
        key = "<A-<>";
        mode = "n";
        options = {
          silent = true;
          desc = "Move buffer left";
        };
      };
      moveNext = {
        key = "<A->>";
        mode = "n";
        options = {
          silent = true;
          desc = "Move buffer right";
        };
      };
      pin = {
        key = "<A-p>";
        mode = "n";
        options = {
          silent = true;
          desc = "Pin Buffer";
        };
      };
      restore = {
        key = "<A-r>";
        mode = "n";
        options = {
          silent = true;
          desc = "Restore Buffer";
        };
      };
      pick = {
        key = "<C-p>";
        mode = "n";
        options = {
          silent = true;
          desc = "Jump to Buffer";
        };
      };
      pickDelete = {
        key = "<C-P>";
        mode = "n";
        options = {
          silent = true;
          desc = "Jump to close Buffer";
        };
      };

    };
  };
}
