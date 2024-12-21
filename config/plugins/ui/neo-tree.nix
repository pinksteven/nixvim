{
  plugins.neo-tree = {
    enable = true;
    closeIfLastWindow = true;
    sources = [
      "filesystem"
      "buffers"
      "git_status"
    ];
    extraOptions.open_files_do_not_replace_types = [
      "terminal"
      "Trouble"
      "trouble"
      "qf"
      "Outline"
    ];
    popupBorderStyle = "rounded"; # “NC”, “double”, “none”, “rounded”, “shadow”, “single”, “solid” or raw lua code

    filesystem = {
      bindToCwd = false;
      useLibuvFileWatcher = true;
      followCurrentFile.enabled = true;
    };

    window = {
      width = 30;
      mappings = {
        "<space>" = "none";
      };
    };

    defaultComponentConfigs = {
      indent = {
        withExpanders = true;
        expanderCollapsed = "";
        expanderExpanded = "";
        expanderHighlight = "NeoTreeExpander";
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>Neotree action=focus reveal toggle<cr>";
      options = {
        silent = true;
        desc = "Toggle NeoTree";
      };
    }
  ];
}
