let
  hello = writeScriptBin "hello" ''
    echo foobar
  '';
in

runCommand "hello" {
  buildInputs = [ hello ];
} ''
  hello > $out
''
