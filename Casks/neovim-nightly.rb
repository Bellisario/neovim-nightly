cask "neovim-nightly" do
  version "nightly-0851e7dabed9fc9c019e22088029f36e9f3ec3e3"

  on_arm do
    sha256 "e93ef6829fd45c9c4a93ef06899506880abaf489a0400598549ffbfae0754cc5"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "eaa5f9bde49e6c0ba313ba78ae057f8acecb59383cbda20d9748261170bebe35"
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
