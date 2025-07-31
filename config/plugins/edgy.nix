{
  plugins.edgy = {
    enable = true;
    autoLoad = true;
    settings = {
      exit_when_last = true;
      close_when_all_hidden = false;
      animate = {
        enabled = true;
        spinner = "require('noice.util.spinners').spinners.circleFull";
      };
      left.__raw = # Lua
        ''
          {
            -- Neo-tree filesystem always takes half the screen height
            {
              title = "Neo-Tree",
              ft = "neo-tree",
              filter = function(buf)
                return vim.b[buf].neo_tree_source == "filesystem"
              end,
              pinned = true,
              size = { height = 0.6 },
              open = "Neotree action=focus reveal toggle",
            },
            {
              title = "Neo-Tree Buffers",
              ft = "neo-tree",
              filter = function(buf)
                return vim.b[buf].neo_tree_source == "buffers"
              end,
              pinned = true,
              collapsed = true, -- show window as closed/collapsed on start
              open = "Neotree position=top buffers",
            },
            { ft = "qf", title = "QuickFix" },
            {
              title = "Aerial",
              ft = "aerial",
              pinned = true,
              collapsed = false,
              open = "AerialOpen",
            }
          }
        '';
      bottom.__raw = # Lua
        ''
          {
            {
            ft = "toggleterm",
            size = { height = 0.4 },
            -- exclude floating windows
            filter = function(buf, win)
              return vim.api.nvim_win_get_config(win).relative == ""
            end,
            },
            "Trouble",
            { ft = "qf", title = "QuickFix" }
          }
        '';
      keys = {
        "]w" = false;
        "[w" = false;
        "<C-.>" = ''
          function(win)
            win:next({ visible = true, focus = true })
          end
        '';
        "<C-,>" = ''
          function(win)
            win:prev({ visible = true, focus = true })
          end
        '';
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>lua require('edgy').open(\"left\")<CR>";
      options.desc = "Open sidebar";
    }
  ];
}
