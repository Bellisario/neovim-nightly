cask "neovim-nightly" do
  version "nightly-29a46a11aa0820e4efcad80a2dfb9ca600924f58"

  on_arm do
    sha256 "bc3ac193a29fd60f331c95b0ef6bf019da0a3ba4f25e1d822003c65759e00f8f"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "5d4039d3737012621893daa309c5209bca288c884cd8cf5a8bb46b4881362ef6"
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
