{
  buildDotnetGlobalTool,
}:

buildDotnetGlobalTool {
  pname = "dotnet-easydotnet";
  nugetName = "EasyDotnet";
  version = "2.3.63";
  nugetHash = "sha256-8ywDdEWxDZUtggvY/2d4Revk09+qb3llymru0Ptpp5c=";
  postFixup = ''
    cd "$out/bin"
    ln -s dotnet-easydotnet easydotnet
  '';
}
