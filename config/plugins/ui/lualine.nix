{ colors, icons, ... }:
{
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        always_divide_middle = true;
        ignore_focus = [
          "neo-tree"
          "toggleterm"
        ];
        globalstatus = true; # have a single statusline at bottom of neovim instead of one for every window
        disabled_filetypes.statusline = [
          "dashboard"
          "startup"
        ];
        section_separators = {
          left = "";
          right = "";
        };
        component_separators = {
          left = "";
          right = "";
        };
      };

      sections = {
        lualine_a = [
          {
            __unkeyed = "mode";
            separator.left = "";
            padding.right = 2;
          }
        ];
        lualine_b = [
          "branch"
          {
            __unkeyed = "filename";
            symbols = {
              modified = icons.git.LineAdded;
              readonly = icons.git.FileIgnored;
            };
          }
        ];
        lualine_c = [
          "diff"
        ];

        lualine_x = [
          {
            __unkeyed = "diagnostics";
            symbols = {
              error = icons.diagnostics.Error;
              warn = icons.diagnostics.Warning;
              hint = icons.diagnostics.Hint;
              info = icons.diagnostics.BoldInformation;
            };
          }

          # Show active language server
          {
            __unkeyed.__raw = ''
              function()
                  local msg = ""
                  local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                  local clients = vim.lsp.get_active_clients()
                  if next(clients) == nil then
                      return msg
                  end
                  for _, client in ipairs(clients) do
                      local filetypes = client.config.filetypes
                      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                          return client.name
                      end
                  end
                  return msg
              end
            '';
            icon = icons.ui.Settings;
          }
          "encoding"
          "fileformat"
        ];

        lualine_y = [
          "filetype"
        ];

        lualine_z = [
          {
            __unkeyed = "location";
            separator.right = "";
            padding.left = 2;
          }
        ];
      };
    };
  };
  extraConfigLua = ''
    local customTheme = {
      normal = {
        a = { fg = "${colors.base00}", bg = "${colors.base0D}"},
        b = { fg = "${colors.base05}", bg = "${colors.base01}"},
        c = { fg = "${colors.base04}"},
      },

      insert = { a = { fg = "${colors.base00}", bg = "${colors.base0B}"}},
      visual = { a = { fg = "${colors.base00}", bg = "${colors.base0A}"}},
      replace = { a = { fg = "${colors.base00}", bg = "${colors.base09}"}},

      inactive = {
        a = { fg = "${colors.base05}", bg = "${colors.base00}" },
        b = { fg = "${colors.base05}", bg = "${colors.base00}" },
        c = { fg = "${colors.base05}" },
      },
    }
    require("lualine").setup({
      options = {
        theme = customTheme,
      },
      })
  '';
}
