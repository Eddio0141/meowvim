{
  buildDotnetGlobalTool,
}:

buildDotnetGlobalTool {
  pname = "dotnet-easydotnet";
  nugetName = "EasyDotnet";
  version = "2.3.49";
  nugetHash = "sha256-K4FdnHRDfHyZHlXU98NIRHjZYR+YUx8tXAdf6LH9lXs=";
  postFixup = ''
    cd "$out/bin"
    ln -s dotnet-easydotnet easydotnet
  '';
}
