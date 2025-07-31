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
      luaConfig.post = # Lua
        ''
          local Offset = require("bufferline.offset")
          if not Offset.edgy then
            local get = Offset.get
            Offset.get = function()
              if package.loaded["edgy"] then
                local layout = require("edgy.config").layout
                local ret = { left = "", left_size = 0, right = "", right_size = 0 }
                for _, pos in ipairs({ "left", "right" }) do
                  local sb = layout[pos]
                  if sb and #sb.wins > 0 then
                    local title = " Sidebar" .. string.rep(" ", sb.bounds.width - 8)
                    ret[pos] = "%#EdgyTitle#" .. title .. "%*" .. "%#WinSeparator#│%*"
                    ret[pos .. "_size"] = sb.bounds.width
                  end
                end
                ret.total_size = ret.left_size + ret.right_size
                if ret.total_size > 0 then
                  return ret
                end
              end
              return get()
            end
            Offset.edgy = true
          end
        '';
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
