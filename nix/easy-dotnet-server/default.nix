{
  buildDotnetGlobalTool,
}:

buildDotnetGlobalTool {
  pname = "dotnet-easydotnet";
  nugetName = "EasyDotnet";
  version = "3.1.2";
  nugetHash = "sha256-Fe7LOPvh5sRkS/M3XxDzmZUNnmc492MraZq1+KiA2uo=";
  postFixup = ''
    cd "$out/bin"
    ln -s dotnet-easydotnet easydotnet
  '';
}
