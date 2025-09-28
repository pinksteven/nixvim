{pkgs, ...}: {
  lsp.servers.qmlls.enable = true;
  plugins = {
    # conform-nvim.settings = {
    #   formatters = {
    #     qmlformat = {
    #       command = "${pkgs.kdePackages.qtdeclarative}/bin/qmlformat";
    #       args = [
    #         "-w"
    #         "2"
    #         "$FILENAME"
    #       ];
    #     };
    #   };
    #
    #   formatters_by_ft.qml = [ "qmlformat" ];
    # };
  };
}
