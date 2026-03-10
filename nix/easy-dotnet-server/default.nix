{
  buildDotnetGlobalTool,
}:

buildDotnetGlobalTool {
  pname = "dotnet-easydotnet";
  nugetName = "EasyDotnet";
  version = "3.0.0";
  nugetHash = "sha256-olaARuN/RErqyZAIiDeHZlYAxlNM/Qfn6wk73nfRBjM=";
  postFixup = ''
    cd "$out/bin"
    ln -s dotnet-easydotnet easydotnet
  '';
}
