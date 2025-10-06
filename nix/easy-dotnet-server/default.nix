{
  buildDotnetGlobalTool,
}:

buildDotnetGlobalTool {
  pname = "EasyDotnet";
  version = "2.3.1";
  nugetHash = "sha256-HW9e5YD/bfqnIHfBhuyIVxz8Xg8e9ibQnDrhF5r7ZgM=";
  postInstall = ''
    echo "foo"
    cd "$out/lib/EasyDotnet"
    mv dotnet-easydotnet EasyDotnet
  '';
}
