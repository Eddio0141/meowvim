{
  buildDotnetGlobalTool,
}:

buildDotnetGlobalTool {
  pname = "dotnet-easydotnet";
  nugetName = "EasyDotnet";
  version = "2.8.6";
  nugetHash = "sha256-F2ysGUFvltPTlQFoxb2vaa1BEmfS5tqmWgVi6TWB71c=";
  postFixup = ''
    cd "$out/bin"
    ln -s dotnet-easydotnet easydotnet
  '';
}
