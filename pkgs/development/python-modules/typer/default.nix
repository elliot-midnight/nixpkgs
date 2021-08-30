{ lib
, buildPythonPackage
, fetchPypi
, click
, pytestCheckHook
, shellingham
, pytest-cov
, pytest-xdist
, pytest-sugar
, coverage
, mypy
, black
, isort
}:

buildPythonPackage rec {
  pname = "typer";
  version = "0.4.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1pgm0zsylbmz1r96q4n3rfi0h3pn4jss2yfs83z0yxa90nmsxhv3";
  };

  propagatedBuildInputs = [ click ];

  preCheck = ''
    export HOME=$TMPDIR
    touch .bashrc
  '';

  checkInputs = [
    pytestCheckHook
    pytest-cov
    pytest-xdist
    pytest-sugar
    shellingham
    coverage
    mypy
    black
    isort
  ];

  meta = with lib; {
    homepage = "https://typer.tiangolo.com/";
    description = "Typer, build great CLIs. Easy to code. Based on Python type hints.";
    license = licenses.mit;
    maintainers = with maintainers; [ winpat ];
  };
}
