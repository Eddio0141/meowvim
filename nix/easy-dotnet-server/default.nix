{
  buildDotnetGlobalTool,
}:

buildDotnetGlobalTool {
  pname = "dotnet-easydotnet";
  nugetName = "EasyDotnet";
  version = "2.9.8";
  nugetHash = "sha256-OImdt9dkK+9qV85yTHRBLDeFs+jEgjdsku+zjjK2gcs=";
  postFixup = ''
    cd "$out/bin"
    ln -s dotnet-easydotnet easydotnet
  '';
}
