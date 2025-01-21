{ config, ... }:
let
  colors = config.theme.colors;
in
{
  plugins.startup = {
    enable = true;

    colors.background = colors.base00;

    sections = {
      header = {
        type = "text";
        oldfilesDirectory = false;
        align = "center";
        foldSection = false;
        title = "Header";
        margin = 5;
        content = [
          " ██╗░░░░██╗░█████╗░███████╗████████╗███████╗ "
          " ██║░░░░██║██╔══██╗██╔════╝╚══██╔══╝██╔════╝ "
          " ██║░█╗░██║███████║███████╗░░░██║░░░█████╗░░ "
          " ██║███╗██║██╔══██║╚════██║░░░██║░░░██╔══╝░░ "
          " ╚███╔███╔╝██║░░██║███████║░░░██║░░░███████╗ "
          " ░╚══╝╚══╝░╚═╝░░╚═╝╚══════╝░░░╚═╝░░░╚══════╝ "
          " ░░░░░░░░░░░░░░██████╗░███████╗░░░░░░░░░░░░░ "
          " ░░░░░░░░░░░░░██╔═══██╗██╔════╝░░░░░░░░░░░░░ "
          " ░░░░░░░░░░░░░██║░░░██║█████╗░░░░░░░░░░░░░░░ "
          " ░░░░░░░░░░░░░██║░░░██║██╔══╝░░░░░░░░░░░░░░░ "
          " ░░░░░░░░░░░░░╚██████╔╝██║░░░░░░░░░░░░░░░░░░ "
          " ░░░░░░░░░░░░░░╚═════╝░╚═╝░░░░░░░░░░░░░░░░░░ "
          " ░░░░░░████████╗██╗███╗░░░███╗███████╗░░░░░░ "
          " ░░░░░░╚══██╔══╝██║████╗░████║██╔════╝░░░░░░ "
          " ░░░░░░░░░██║░░░██║██╔████╔██║█████╗░░░░░░░░ "
          " ░░░░░░░░░██║░░░██║██║╚██╔╝██║██╔══╝░░░░░░░░ "
          "  ░░░░░░░░██║░░░██║██║░╚═╝░██║███████╗░░░░░  "
          "    ░░░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝╚══════╝░░░    "
        ];
        highlight = "";
        defaultColor = colors.base0D;
        oldfilesAmount = 0;
      };
      body = {
        type = "mapping";
        oldfilesDirectory = false;
        align = "center";
        foldSection = false;
        title = "Menu";
        margin = 5;
        content = [
          [
            "  Find File"
            "Telescope find_files"
            "f"
          ]
          [
            "  New File"
            "lua require'startup'.new_file()"
            "n"
          ]
          [
            "󰈚  Recent Files"
            "require('telescope.builtin').oldfiles"
            "r"
          ]
          [
            "󰈭  Find Word"
            "Telescope live_grep"
            "g"
          ]
          [
            "  Restore Session"
            "lua require'persistence'.load({last = true})"
            "s"
          ]

          [
            "  List Sessions"
            "lua require'persistence'.select()"
            "S"
          ]
          [
            "󰉋  File Browser"
            "Yazi"
            "e"
          ]
          [
            "  Quit Neovim"
            "qa"
            "q"
          ]
        ];
        highlight = "";
        defaultColor = colors.base0E;
        oldfilesAmount = 0;
      };
    };
    options = {
      paddings = [
        1
        3
      ];
    };
    parts = [
      "header"
      "body"
    ];

  };
}
