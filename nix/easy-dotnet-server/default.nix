{
  buildDotnetGlobalTool,
}:

buildDotnetGlobalTool {
  pname = "dotnet-easydotnet";
  nugetName = "EasyDotnet";
  version = "3.0.4";
  nugetHash = "sha256-lTktQ917MDE+3oZ2SlauigjsyBZ8n77iWLojGYt8tZY=";
  postFixup = ''
    cd "$out/bin"
    ln -s dotnet-easydotnet easydotnet
  '';
}
