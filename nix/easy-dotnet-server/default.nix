{
  buildDotnetGlobalTool,
}:

buildDotnetGlobalTool {
  pname = "dotnet-easydotnet";
  nugetName = "EasyDotnet";
  version = "2.3.58";
  nugetHash = "sha256-pjGlLNdKDVRqZX6tpHroIXgHQgS8nCUgjRMp9li0BvA=";
  postFixup = ''
    cd "$out/bin"
    ln -s dotnet-easydotnet easydotnet
  '';
}
