{
  buildDotnetGlobalTool,
}:

buildDotnetGlobalTool {
  pname = "dotnet-easydotnet";
  nugetName = "EasyDotnet";
  version = "2.9.9";
  nugetHash = "sha256-9tt5j4BdmOr8so78ntLjj2Xh7c5mCTPyCPfSzLqg2pk=";
  postFixup = ''
    cd "$out/bin"
    ln -s dotnet-easydotnet easydotnet
  '';
}
