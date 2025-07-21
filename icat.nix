{
  stdenv,
  fetchFromGitHub,
  imlib2,
  xorg,
}:

stdenv.mkDerivation {
  pname = "icat";
  version = "v0.5";
  src = fetchFromGitHub {
    repo = "icat";
    owner = "atextor";
    rev = "v0.5";
    sha256 = "sha256-aiLPVdKSppT/PWPW0Ue475WG61pBLh8OtLuk2/UU3nM=";
  };

  buildInputs = [ imlib2 xorg.libX11 ];

  buildPhase = ''
    make
  '';

  installPhase = ''
    runHook preInstall
    mkdir -pv $out/bin
    cp -v icat $out/bin
    runHook postInstall
  '';
}
