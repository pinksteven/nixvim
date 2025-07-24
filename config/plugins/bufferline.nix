{ config, ... }:
{
  plugins = {
    bufferline = {
      enable = true;
      settings = {
        options = {
          indicator_icon = null;
          indicator.style = "underline";

          close_command.__raw = "function(n) Snacks.bufdelete(n) end";
          right_mouse_command.__raw = "function(n) Snacks.bufdelete(n) end";

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

  highlight."TabLineSel" =
    let
      colors = config.plugins.mini.modules.base16.palette;
    in
    {
      fg = colors.base0D;
      bg = colors.base0D;
      sp = colors.base0D;
      bold = true;
    };
}
