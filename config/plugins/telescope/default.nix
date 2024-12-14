{ pkgs, ... }:
{
  plugins = {
    project-nvim.enableTelescope = true;
    telescope = {
      enable = true;
      extensions = {
        fzf-native.enable = true;
        undo.enable = true;
        ui-select = {
          settings = {
            specific_opts = {
              codeactions = true;
            };
          };
        };
      };

      settings.defaults = {
        prompt_prefix = "   ";
        color_devicons = true;
        set_env.COLORTERM = "truecolor";

        mappings = {
          i = {
            # Have Telescope not to enter a normal-like mode when hitting escape (and instead exiting), you can map <Esc> to do so via:
            "<esc>".__raw = ''
              function(...)
                return require("telescope.actions").close(...)
              end'';
            "<c-t>".__raw = ''
              function(...)
                require('trouble.providers.telescope').open_with_trouble(...);
              end
            '';
          };
          n = {
            "<c-t>".__raw = ''
              function(...)
                require('trouble.providers.telescope').open_with_trouble(...);
              end
            '';
          };
        };
        # trim leading whitespace from grep
        vimgrep_arguments = [
          "${pkgs.ripgrep}/bin/rg"
          "--color=never"
          "--no-heading"
          "--with-filename"
          "--line-number"
          "--column"
          "--smart-case"
          "--trim"
        ];
      };
      keymaps = {
        "<leader>ft" = {
          action = "todo-comments";
          options.desc = "Search Todo";
        };
        "<leader>fn" = {
          action = "notify";
          options.desc = "Search Notifications";
        };
        "<leader>fu" = {
          action = "undo";
          options.desc = "Search Undo";
        };
        "<leader>ff" = {
          action = "find_files hidden=true";
          options.desc = "Find project files";
        };
        "<leader>f/" = {
          action = "live_grep";
          options.desc = "Grep (root dir)";
        };
        "<leader>f:" = {
          action = "command_history";
          options.desc = "Command History";
        };
        "<leader>fr" = {
          action = "oldfiles";
          options.desc = "Recent";
        };
        "<c-p>" = {
          mode = [
            "n"
            "i"
          ];
          action = "registers";
          options.desc = "Select register to paste";
        };
        "<leader>gc" = {
          action = "git_commits";
          options.desc = "commits";
        };
        "<leader>fa" = {
          action = "autocommands";
          options.desc = "Auto Commands";
        };
        "<leader>fc" = {
          action = "commands";
          options.desc = "Commands";
        };
        "<leader>fd" = {
          action = "diagnostics bufnr=0";
          options.desc = "Workspace diagnostics";
        };
        "<leader>fh" = {
          action = "help_tags";
          options.desc = "Help pages";
        };
        "<leader>fk" = {
          action = "keymaps";
          options.desc = "Key maps";
        };
        "<leader>fM" = {
          action = "man_pages";
          options.desc = "Man pages";
        };
        "<leader>fm" = {
          action = "marks";
          options.desc = "Jump to Mark";
        };
        "<leader>fo" = {
          action = "vim_options";
          options.desc = "Options";
        };
      };
    };
  };
}
