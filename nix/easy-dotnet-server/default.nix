{
  buildDotnetGlobalTool,
}:

buildDotnetGlobalTool {
  pname = "dotnet-easydotnet";
  nugetName = "EasyDotnet";
  version = "3.0.38";
  nugetHash = "sha256-Up1L4kpTzi7BpTTFNapoe0jZ6gOhWVCL5n+5fzZRkbE=";
  postFixup = ''
    cd "$out/bin"
    ln -s dotnet-easydotnet easydotnet
  '';
}
