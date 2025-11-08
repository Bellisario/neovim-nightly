cask "neovim-nightly" do
  version "nightly-466b2ac1929ab120642e2cc91fbf1699d6ee1f9c"

  on_arm do
    sha256 "f2c7cc3d032ce30496fe5cd4dc6ed9c8efd1364a2dda9c13790ec2147c7bad7d"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "4e76a8691b30137f4156cadbbf1954057b2b4ff1a91455116ce180c50ec9d3ee"
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
