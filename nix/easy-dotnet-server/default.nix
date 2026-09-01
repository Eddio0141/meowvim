{
  buildDotnetModule,
  fetchFromGitHub,
  dotnetCorePackages,
}:

buildDotnetModule {
  name = "easy-dotnet-server";
  src = fetchFromGitHub {
    owner = "GustavEikaas";
    repo = "easy-dotnet-server";
    rev = "c76c2b9978259cf46209406b28a4ec41237909e5";
    hash = "sha256-VJopQeKKF5RALQmiBmF0PEhuNwbviRL/8vDEyEe6GFs=";
  };
  projectFile = [
    # "EasyDotnet.AppWrapper.Contracts/EasyDotnet.AppWrapper.Contracts.csproj"
    # "EasyDotnet.AppWrapper/EasyDotnet.AppWrapper.csproj"
    # "EasyDotnet.Aspire.Contracts/EasyDotnet.Aspire.Contracts.csproj"
    # "EasyDotnet.Aspire/EasyDotnet.Aspire.csproj"
    # "EasyDotnet.Aspire.Tests/EasyDotnet.Aspire.Tests.csproj"
    # "EasyDotnet.BuildServer.Contracts/EasyDotnet.BuildServer.Contracts.csproj"
    # "EasyDotnet.BuildServer/EasyDotnet.BuildServer.csproj"
    # "EasyDotnet.BuildServer.SmokeTests/EasyDotnet.BuildServer.SmokeTests.csproj"
    "EasyDotnet.ContainerTests/EasyDotnet.ContainerTests.csproj"
    "EasyDotnet.Debugger.Tests/EasyDotnet.Debugger.Tests.csproj"
    "EasyDotnet.Debugger/EasyDotnet.Debugger.csproj"
    "EasyDotnet.IDE/EasyDotnet.IDE.csproj"
    "EasyDotnet.IDE.Tests/EasyDotnet.IDE.Tests.csproj"
    "EasyDotnet.IntegrationTests/EasyDotnet.IntegrationTests.csproj"
    "EasyDotnet.Nuget/EasyDotnet.Nuget.csproj"
    "EasyDotnet.ProjXLanguageServer.Tests/EasyDotnet.ProjXLanguageServer.Tests.csproj"
    "EasyDotnet.ProjXLanguageServer/EasyDotnet.ProjXLanguageServer.csproj"
    "EasyDotnet.RoslynLanguageServices.Tests/EasyDotnet.RoslynLanguageServices.Tests.csproj"
    "EasyDotnet.RoslynLanguageServices/EasyDotnet.RoslynLanguageServices.csproj"
    "EasyDotnet.StartupHook/EasyDotnet.StartupHook.csproj"
  ];
  nugetDeps = ./deps.json;
  dotnet-sdk = dotnetCorePackages.sdk_8_0;
}
