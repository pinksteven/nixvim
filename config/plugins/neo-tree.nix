{
  plugins.neo-tree = {
    enable = true;
    closeIfLastWindow = true;
    autoCleanAfterSessionRestore = true;
    hideRootNode = true;
    retainHiddenRootIndent = true;
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
      "edgy"
    ];
    popupBorderStyle = "rounded";

    filesystem = {
      asyncDirectoryScan = "auto";
      bindToCwd = false;
      useLibuvFileWatcher = true;
      followCurrentFile.enabled = true;
      filteredItems.visible = true;

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
}
