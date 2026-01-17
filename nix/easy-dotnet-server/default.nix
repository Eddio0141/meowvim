{
  buildDotnetGlobalTool,
}:

buildDotnetGlobalTool {
  pname = "dotnet-easydotnet";
  nugetName = "EasyDotnet";
  version = "2.3.59";
  nugetHash = "sha256-12KlUR5d8aQnro2HGzhtoqdAz7CIMZuwqvrN4sENrFs=";
  postFixup = ''
    cd "$out/bin"
    ln -s dotnet-easydotnet easydotnet
  '';
}
