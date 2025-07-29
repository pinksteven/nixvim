{
  plugins.edgy = {
    enable = true;
    autoLoad = true;
    settings = {
      exit_when_last = true;
      animate = {
        enabled = true;
        spinner = "require('noice.util.spinners').spinners.circleFull";
      };
      left = [
        {
          title = "Neo-Tree";
          ft = "neo-tree";
          filter = # Lua
            ''
              function(buf)
                return vim.b[buf].neo_tree_source == "filesystem"
              end
            '';
        }
        {
          title = "Neo-Tree Buffers";
          ft = "neo-tree";
          filter = # Lua
            ''
              function(buf)
                return vim.b[buf].neo_tree_source == "buffers"
              end
            '';
          pinned = true;
          open = "Neotree position=top buffers";
        }
        {
          title = "Aerial";
          ft = "aerial";
          pinned = true;
          open = "AerialOpen";
        }
      ];
      bottom = [ "Trouble" ];
    };
  };
}
