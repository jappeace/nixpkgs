{ lib }:
let

  evalTest = module: lib.evalModules {
    modules = testModules ++ [ module ];
    class = "nixosTest";
  };
  runTest = module: (evalTest ({ config, ... }: { imports = [ module ]; result = config.test; })).config.result;

  evalContainersTests = module: lib.evalModules {
    modules = containerModules ++ [ module ];
    class = "nixosTest";
  };

  runContainerTest = module: (evalContainersTests ({ config, ... }: { imports = [ module ]; result = config.test; })).config.result;

  containerModules = [
    ./name.nix
    ./nodes.nix
    ./driver.nix
  ];

  testModules = [
    ./call-test.nix
    ./driver.nix
    ./interactive.nix
    ./legacy.nix
    ./meta.nix
    ./name.nix
    ./network.nix
    ./nodes.nix
    ./pkgs.nix
    ./run.nix
    ./testScript.nix
  ];

in
{
  inherit evalTest runTest testModules runContainerTest evalContainersTests;
}
