/*
 * xbuild
 */
{ stdenv, fetchFromGitHub, rustPlatform, pkgs, lib }:
rustPlatform.buildRustPackage rec {
  version = "v0.5.29";
  pname = "cargo-xbuild";

  src = fetchFromGitHub {
    owner = "mauriciojost";
    repo = "cargo-xbuild";
    rev = "b278ae4aacac6b0c0c08cf869a283126ecdb5b9e";

    sha256 = "1r9jq1mqwdwf7nh9siq2s7zni9lv7fabb70namx5a8zzhwgihyan";
  };

  propagatedBuildInputs = [
    pkgs.ncurses
  ];

  cargoSha256 = "1pj8zfkr51y7lbjg9c3di4gr8a2l0z5gqslk6wmsiry6vcj2sks1";

  /*
   * Just copied from upstream crates.io
   */
  meta = with stdenv.lib; {
    description = "Automatically cross-compiles the sysroot crates core, compiler_builtins, and alloc.";
    homepage = https://github.com/rust-osdev/cargo-xbuild;
    maintainers = with maintainers; [ "phil-opp" ];
    license = with licenses; [ mit asl20 ];
    platforms = platforms.unix;
  };
}
