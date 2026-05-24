{
  buildDotnetGlobalTool,
}:

buildDotnetGlobalTool {
  pname = "dotnet-easydotnet";
  nugetName = "EasyDotnet";
  version = "3.2.1";
  nugetHash = "sha256-9mxri1MTyTBaQCEIg+uxx5Jgajg/umuTuWH1A8AVIqA=";
  postFixup = ''
    cd "$out/bin"
    ln -s dotnet-easydotnet easydotnet
  '';
}
