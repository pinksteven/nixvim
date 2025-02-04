{ config, icons, ... }:
let
  colors = config.theme.colors;
in
{
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        always_divide_middle = true;
        ignore_focus = [
          "neo-tree"
        ];
        globalstatus = true; # global status line instead of separate for every window
        disabled_filetypes.statusline = [
          "dashboard"
          "startup"
          "alpha"
        ];
        section_separators = {
          left = "";
          right = "";
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
          }
        ];
        lualine_b = [
          "branch"
        ];
        lualine_c = [
          {
            __unkeyed = "filename";
            symbols = {
              modified = icons.git.LineAdded;
              readonly = icons.git.FileIgnored;
            };
          }
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
