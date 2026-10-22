cask "neovim-nightly" do
  version "nightly-d714648b8e7c476b7b5c1f661aa192b179bfc1d3"

  on_arm do
    sha256 "fccddda1862a08727f1b4656f20840e5a67dca0adf3f618476ec62b03740a405"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "6ea788cf9d5c52d52fac7d66ad45e8abe8cbd3e4311ad3143f117196d7e031f6"
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
