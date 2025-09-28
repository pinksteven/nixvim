{
  plugins = {
    copilot-lua.enable = true;
    avante = {
      enable = true;

      settings = {
        auto_suggestions_provider = "copilot";
        provider = "copilot";

        # Define our own mappings under correct prefix
        mappings = {
          ask = "<leader>aaa";
          new_ask = "<leader>aan";
          edit = "<leader>aae";
          refresh = "<leader>aar";
          focus = "<leader>aaf";
          stop = "<leader>aaS";
          toggle = {
            default = "<leader>aat";
            debug = "<leader>aad";
            hint = "<leader>aah";
            suggestion = "<leader>aas";
            repomap = "<leader>aaR";
          };
          files = {
            add_current = "<leader>aa.";
            add_all_buffers = "<leader>aaB";
          };
          select_model = "<leader>aa?";
          select_history = "<leader>aah";
          zen_mode = "<leader>aaz";
        };
      };
    };

    which-key.settings.spec = [
      {
        __unkeyed-1 = "<leader>aa";
        group = "Avante";
        icon = "";
      }
    ];
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>aac";
      action = "<CMD>AvanteClear<CR>";
      options.desc = "avante: clear";
    }
  ];
}
