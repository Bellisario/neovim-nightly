cask "neovim-nightly" do
  version "nightly-c040f53dc10c433a5a051f403832120e191dd6d0"

  on_arm do
    sha256 "c2350e0f387fb65b32c134a0ce52441d4055a9c0a825613ca80e4bb0d2cbe28b"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "0a09b89af18dece95c739d4eb62e22cbcb5c13bbe19f4550c0ec65772288ddba"
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
