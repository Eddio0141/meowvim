{
  buildDotnetGlobalTool,
}:

buildDotnetGlobalTool {
  pname = "dotnet-easydotnet";
  nugetName = "EasyDotnet";
  version = "3.4.26";
  nugetHash = "sha256-Sn4zzJ4nWkkp5o/aJ9HV8m+JW4DWx09/MsNEbWU1qYU=";
  postFixup = ''
    cd "$out/bin"
    ln -s dotnet-easydotnet easydotnet
  '';
}
