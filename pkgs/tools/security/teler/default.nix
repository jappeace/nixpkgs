{ lib
, buildGoModule
, fetchFromGitHub
}:

buildGoModule rec {
  pname = "teler";
  version = "1.2.1";

  src = fetchFromGitHub {
    owner = "kitabisa";
    repo = "teler";
    rev = "v${version}";
    sha256 = "sha256-lExZWFj0PQFUBJgfhahF8PfYaOndRxKyVHoMlubmEpc=";
  };

  vendorSha256 = "sha256-TQjwPem+RMuoF5T02CL/CTvBS6W7Q786gTvYUFIvxjE=";

  preBuild = ''
    buildFlagsArray+=("-ldflags" "-s -w -X ktbs.dev/teler/common.Version=${version}")
  '';

  # test require internet access
  doCheck = false;

  meta = with lib; {
    description = "Real-time HTTP Intrusion Detection";
    longDescription = ''
      teler is an real-time intrusion detection and threat alert
      based on web log that runs in a terminal with resources that
      we collect and provide by the community.
    '';
    homepage = "https://github.com/kitabisa/teler";
    license = licenses.asl20;
    maintainers = with maintainers; [ fab ];
  };
}
