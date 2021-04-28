{ mkDerivation, standard-library, fetchFromGitHub }:

mkDerivation {
  pname = "groups";
  version = "master";

  buildInputs = [ standard-library."1.3" ];

  src = fetchFromGitHub {
    owner = "alexarice";
    repo = "Groups";
    # Change this
    rev = "57748da9f3b1b4faceee089ad7ef6da72eb1f539";
    sha256 = "0wmscci0n9v0d4sp6gj82l6zqfaib3qk4hzb5dzrh0qnmgn48jaz";
  };
}
