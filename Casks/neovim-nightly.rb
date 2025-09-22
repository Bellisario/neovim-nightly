cask "neovim-nightly" do
  version "nightly-4adfc4b7bcd1f4021e9b338273ee43822294ca43"

  on_arm do
    sha256 "a5b260a2ad6ebc5436f3b50e25471869241ad21f93c7f81945b6cf223203c989"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "2cfe19750ebe78a911fbfda55d78b451d7420c1fd3692d2ebca0afd9d215f799"
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
