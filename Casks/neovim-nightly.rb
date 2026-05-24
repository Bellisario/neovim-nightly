cask "neovim-nightly" do
  version "nightly-61eddb3fe7b01fb904bb9a87a78ef1239c01eb2e"

  on_arm do
    sha256 "eb2b63b7567399b8ba82bce0cdf29a0dae5a0e644edca49194e717483eee9220"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "147698e58a56594395df9ddf4d58d3a05e61aae087e8b208017a51c0667a7bef"
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
