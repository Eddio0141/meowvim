{
  buildDotnetGlobalTool,
}:

buildDotnetGlobalTool {
  pname = "dotnet-easydotnet";
  nugetName = "EasyDotnet";
  version = "3.0.9";
  nugetHash = "sha256-b9E+ziyzKgglK2dqWjy7+BwaNFju/7TNXIKROUtT6GU=";
  postFixup = ''
    cd "$out/bin"
    ln -s dotnet-easydotnet easydotnet
  '';
}
