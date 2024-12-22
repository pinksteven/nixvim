{
  plugins.noice = {
    enable = true;

    settings = {
      # Hides the title above noice boxes
      cmdline = {
        format = {
          filter = {
            icon = ""; # Make bash icon nicer
          };
        };
      };

      lsp = {
        override = {
          "vim.lsp.util.convert_input_to_markdown_lines" = true;
          "vim.lsp.util.stylize_markdown" = true;
          "cmp.entry.get_documentation" = true;
        };

        progress.enabled = true;
        signature.enabled = false;
      };

      notify.enabled = true;

      presets = {
        bottom_search = true;
        command_palette = true;
        long_message_to_split = true;
        inc_rename = true;
        lsp_doc_border = true;
      };

      routes = [
        {
          filter = {
            event = "msg_show";
            any = [
              { find = "%d+L, %d+B"; }
              { find = "; after #%d+"; }
              { find = "; before #%d+"; }
            ];
          };
          view = "mini";
        }
        {
          filter = {
            event = "msg_show";
            kind = "search_count";
          };
          opts = {
            skip = true;
          };
        }
        {
          # skip progress messages from noisy servers
          filter = {
            event = "lsp";
            kind = "progress";
            cond.__raw = ''
              function(message)
                local client = vim.tbl_get(message.opts, 'progress', 'client')
                local servers = { 'jdtls' }

                for index, value in ipairs(servers) do
                    if value == client then
                        return true
                    end
                end
              end
            '';
          };
          opts = {
            skip = true;
          };
        }
      ];
    };
  };

  # Used as a backend for noice
  plugins.nui.enable = true;

  keymaps = [
    {
      mode = "n";
      key = "<leader>fn";
      action = "<cmd>Telescope noice<CR>";
      options = {
        desc = "Find notifications";
      };
    }
  ];
}
