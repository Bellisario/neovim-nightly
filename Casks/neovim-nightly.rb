cask "neovim-nightly" do
  version "nightly-41294e42533daf937410b6285e20a7c0a898f9a8"

  on_arm do
    sha256 "cc77cadcd2cdc15966baa80a0689bf1a37c3aef48ca5671eb5e214a12a973f22"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "7e7ce74e95b3adbdb3313780d15faebc9301c6856863bdc4b6a86ee39e65f3ba"
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
