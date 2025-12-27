cask "neovim-nightly" do
  version "nightly-47aef025a7079f35234157e1080c997c4e90a91e"

  on_arm do
    sha256 "0f0fd6e43d362e3babc3b960ea25e4951f8ee8f0e8cbffa53c903fb3b80aacc4"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "cc26de3bfe0972c52ad749d3116eac70ad0015d1c3ecaccbad124d9622da3a0b"
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
