{
  plugins.ts-context-commentstring.enable = true;
  plugins.mini = {
    enable = true;
    modules = {
      pairs = {
        modes = {
          insert = true;
          command = true;
          terminal = false;
        };
        skip_next = ''[=[[%w%%%'%[%"%.%`%$]]=]'';
        skip_ts = [ "string" ];
        skip_unbalanced = true;
        markdown = true;
      };
      cursorword = { };
      git = { };
      comment = {
        options = {
          customCommentString = ''
            <cmd>lua require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring<cr>
          '';
        };
        mappings = {
          comment = "<leader>/";
          comment_line = "<leader>/";
          comment_visual = "<leader>/";
          textobject = "<leader>/";
        };
      };
    };
  };
}
