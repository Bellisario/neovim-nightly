cask "neovim-nightly" do
  version "nightly-d6bee7e407442112ee9008ea35d6fe73dbb3eaaf"

  on_arm do
    sha256 "a63b7a2f0a059e28efca93fdb2e9d46778bc3b5c0a4d384263ce4c2a66646c1c"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "5cb9b3290735c44e05961eab6d521eb82d5491ad26d7551d74f4bd0eb69df6df"
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
