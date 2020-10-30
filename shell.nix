let
   pkgs = import <nixpkgs> {};
in pkgs.clangStdenv.mkDerivation rec {
  name = "vulkan-tut-dev";
  LIBCLANG_PATH="${pkgs.llvmPackages.libclang}/lib";
  nativeBuildInputs = [ pkgs.pkg-config ];
  buildInputs = with pkgs; [
    clangStdenv
    clang

    xorg.libxcb

    glew
    glfw
    glm

    vulkan-tools
    vulkan-loader
    vulkan-headers
    vulkan-validation-layers
  ];
}
