cask "neovim-nightly" do
  version "nightly-be73c35943f85e7835c3a0fc89bddaeba944db29"

  on_arm do
    sha256 "ec0e7094d3a4c05fb51cd6277fa2ef362a44fa08d583d29af0ad04347eeddf7c"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "ccfc4318ef69fccb98940f8126dcb2f0a8271a4e02c7e0dd16419c38d4fd91b8"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-x86_64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-x86_64/bin/nvim"
  end

  name "Neovim"
  desc "Vim-fork focused on extensibility and usability"
  homepage "https://neovim.io"

  caveats <<~EOS
    This cask conflicts with the neovim formula. You should uninstall it with
    `brew uninstall neovim` before installing this cask.
  EOS

  postflight do
    system_command "xattr", args: ["-cr", "#{staged_path}"]
  end
end
