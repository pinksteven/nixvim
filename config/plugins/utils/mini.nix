{
  plugins.mini = {
    enable = true;
    modules = {
      bracketed = { };
      comment = {
        options = {
          customCommentString = ''
            <cmd>lua require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring<cr>
          '';
        };
      };
    };
  };
  plugins.ts-context-commentstring.enable = true;
}
