{
  buildDotnetGlobalTool,
}:

buildDotnetGlobalTool {
  pname = "dotnet-easydotnet";
  nugetName = "EasyDotnet";
  version = "2.3.54";
  nugetHash = "sha256-GESKSUfagof4m+8FlmmlZvS9LNgTN4lDmF3lfsNQOoo=";
  postFixup = ''
    cd "$out/bin"
    ln -s dotnet-easydotnet easydotnet
  '';
}
