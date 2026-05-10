{
  buildDotnetGlobalTool,
}:

buildDotnetGlobalTool {
  pname = "dotnet-easydotnet";
  nugetName = "EasyDotnet";
  version = "3.1.8";
  nugetHash = "sha256-QFeVvtA3m40Xacm8I00Bh6PP7RHgmz9gPySuokcf3YA=";
  postFixup = ''
    cd "$out/bin"
    ln -s dotnet-easydotnet easydotnet
  '';
}
