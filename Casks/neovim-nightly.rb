cask "neovim-nightly" do
  version "nightly-1cde71233fcf972c5a4ddd155278af299527bb9f"

  on_arm do
    sha256 "4a567cf006f7f1d6bc766cc238ae5dc51925d62197fc4fb8e2701f8c39b20176"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "b2ce35e58df48d2174ab6cf33a2c302fbed2dbeff5aed23a09111f5bbe3f8e80"
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
