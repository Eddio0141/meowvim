{
  buildDotnetGlobalTool,
}:

buildDotnetGlobalTool {
  pname = "dotnet-easydotnet";
  nugetName = "EasyDotnet";
  version = "2.3.42";
  nugetHash = "sha256-v1zoBGQpGsQONMj0wYxnFrL0zA0qcMyfi35MBV+KJXg=";
  postFixup = ''
    cd "$out/bin"
    ln -s dotnet-easydotnet easydotnet
  '';
}
