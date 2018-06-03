with import <nixpkgs> {};

let

  mkOver = file: args: builtins.scopedImport args file // {
    override = new: mkOver file (args // new);
  };

  callPkg = file: args: mkOver file (pkgs // args);

in rec {

  foo = callPkg ./foo.nix {};

  fooOverride = foo.override {
    hello = pkgs.writeScriptBin "hello" ''
      echo test!
    '';
  };


}
