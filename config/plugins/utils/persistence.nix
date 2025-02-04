{
  plugins.persistence = {
    enable = true;
  };

  autoCmd = [
    {
      event = "User";
      pattern = "PersistenceSavePre";
      command = ''Neotree close source=filesystem'';
    }
    {
      event = "User";
      pattern = "PersistenceLoadPost";
      command = ''Neotree action=show reveal'';
    }
  ];
}
