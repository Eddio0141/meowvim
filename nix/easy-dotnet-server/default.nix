{
  buildDotnetGlobalTool,
}:

buildDotnetGlobalTool {
  pname = "dotnet-easydotnet";
  nugetName = "EasyDotnet";
  version = "3.2.12";
  nugetHash = "sha256-mTvcx3/ef42nv1/k3FijV/55H4DzBHWv/rFgh/AHfJ0=";
  postFixup = ''
    cd "$out/bin"
    ln -s dotnet-easydotnet easydotnet
  '';
}
