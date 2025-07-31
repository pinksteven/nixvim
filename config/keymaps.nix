{
  globals.mapleader = " ";

  keymaps = [
    {
      mode = [
        "n"
        "v"
        "i"
      ];
      key = "<C-s>";
      action = "<cmd>w<cr><esc>";
      options = {
        silent = true;
        desc = "Save file";
      };
    }

    # Quit/Session
    {
      mode = "n";
      key = "<leader>qq";
      action = "<cmd>quitall<cr><esc>";
      options = {
        silent = true;
        desc = "Quit all";
      };
    }

    {
      mode = "n";
      key = "<leader>uw";
      action = ":lua ToggleWrap()<cr>";
      options = {
        silent = true;
        desc = "Toggle Line Wrap";
      };
    }

    # Move Lines
    {
      mode = "n";
      key = "<A-Up>";
      action = "<cmd>m .-2<cr>==";
      options.desc = "Move line up";
    }

    {
      mode = "v";
      key = "<A-Up>";
      action = ":m '<-2<cr>gv=gv";
      options.desc = "Move line up";
    }

    {
      mode = "n";
      key = "<A-Down>";
      action = "<cmd>m .+1<cr>==";
      options.desc = "Move line down";
    }

    {
      mode = "v";
      key = "<A-Down>";
      action = ":m '>+1<cr>gv=gv";
      options.desc = "Move line Down";
    }

    # Better indenting
    {
      mode = "v";
      key = "<";
      action = "<gv";
    }

    {
      mode = "v";
      key = ">";
      action = ">gv";
    }

    {
      mode = "i";
      key = "<C-a>";
      action = "<cmd> norm! ggVG<cr>";
      options.desc = "Select all lines in buffer";
    }

    # Clear search with ESC
    {
      mode = [
        "n"
        "i"
      ];
      key = "<esc>";
      action = "<cmd>noh<cr><esc>";
      options = {
        silent = true;
        desc = "Escape and clear hlsearch";
      };
    }

    # Paste stuff without saving the deleted word into the buffer
    {
      mode = "x";
      key = "p";
      action = "\"_dP";
      options.desc = "Deletes to void register and paste over";
    }

    # Copy stuff to system clipboard with <leader> + y or just y to have it just in vim
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>y";
      action = "\"+y";
      options.desc = "Copy to system clipboard";
    }

    # Delete to void register
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>D";
      action = "\"_d";
      options.desc = "Delete to void register";
    }
  ];
}
