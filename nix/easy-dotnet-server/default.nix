{
  buildDotnetGlobalTool,
}:

buildDotnetGlobalTool {
  pname = "dotnet-easydotnet";
  nugetName = "EasyDotnet";
  version = "3.1.31";
  nugetHash = "sha256-JOq0gl1JBTiDzP/dqHqGyhPqIX3peTPAGBokh9iY7pc=";
  postFixup = ''
    cd "$out/bin"
    ln -s dotnet-easydotnet easydotnet
  '';
}
