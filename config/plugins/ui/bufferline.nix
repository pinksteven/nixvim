{ colors, ... }:
{
  plugins = {
    bufferline = {
      enable = true;
      settings = {
        highlights = {
          background = {
            bg = colors.base00;
            fg = colors.base03;
          };

          buffer_selected = {
            bg = colors.base00;
            fg = colors.base05;
          };
          buffer_visible = {
            fg = colors.base05;
            bg = colors.base00;
          };

          error = {
            fg = colors.base08;
            bg = colors.base00;
          };
          error_diagnostic = {
            fg = colors.base08;
            bg = colors.base00;
          };

          close_button = {
            fg = colors.base03;
            bg = colors.base00;
          };
          close_button_visible = {
            fg = colors.base05;
            bg = colors.base00;
          };
          close_button_selected = {
            fg = colors.base05;
            bg = colors.base00;
          };
          fill = {
            bg = colors.base00;
            fg = colors.base05;
          };
          trunc_marker = {
            fg = colors.base04;
            bg = colors.base00;
          };

          separator = {
            bg = colors.base00;
            fg = colors.base00;
          };
          separator_visible = {
            bg = colors.base00;
            fg = colors.base00;
          };
          separator_selected = {
            bg = colors.base00;
            fg = colors.base00;
          };
        };

        options = {
          indicator_icon = null;
          indicator.style = "underline";

          hover = {
            enabled = true;
            delay = 0;
            reveal = [ "close" ];
          };

          offsets = [
            {
              filetype = "neo-tree";
              text = "Neo-tree";
              highlight = "Directory";
              text_align = "left";
            }
          ];
          diagnostics = "nvim_lsp";
          diagnostics_indicator = # Lua
            ''
              function(count, level, diagnostics_dict, context)
                local s = ""
                for e, n in pairs(diagnostics_dict) do
                  local sym = e == "error" and " "
                    or (e == "warning" and " " or "" )
                  if(sym ~= "") then
                    s = s .. " " .. n .. sym
                  end
                end
                return s
              end
            '';
        };
      };
    };
  };

  highlight."TabLineSel" = {
    fg = colors.base0D;
    bg = colors.base0D;
    sp = colors.base0D;
    bold = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<C-Tab>";
      action = "<cmd>BufferLineCycleNext<cr>";
      options = {
        desc = "Cycle to next buffer";
      };
    }

    {
      mode = "n";
      key = "<C-S-Tab>";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options = {
        desc = "Cycle to previous buffer";
      };
    }

    {
      mode = "n";
      key = "<C-x>";
      action = "<cmd>:bp | bd #<cr>";
      options = {
        desc = "Delete buffer";
      };
    }

    {
      mode = "n";
      key = "<leader>br";
      action = "<cmd>BufferLineCloseRight<cr>";
      options = {
        desc = "Delete buffers to the right";
      };
    }

    {
      mode = "n";
      key = "<leader>bl";
      action = "<cmd>BufferLineCloseLeft<cr>";
      options = {
        desc = "Delete buffers to the left";
      };
    }

    {
      mode = "n";
      key = "<leader>bo";
      action = "<cmd>BufferLineCloseOthers<cr>";
      options = {
        desc = "Delete other buffers";
      };
    }

    {
      mode = "n";
      key = "<leader>bp";
      action = "<cmd>BufferLineTogglePin<cr>";
      options = {
        desc = "Toggle pin";
      };
    }

    {
      mode = "n";
      key = "<leader>bP";
      action = "<Cmd>BufferLineGroupClose ungrouped<CR>";
      options = {
        desc = "Delete non-pinned buffers";
      };
    }
  ];
}
