cask "neovim-nightly" do
  version "nightly-ff777f9a858a5f360e220596c63bc69e19a1d5c1"

  on_arm do
    sha256 "b40d4ef85e576b60b193ec3ae8ee6c3655afd1a8fa8236242acef020348e5cd2"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "bfdc2472cc0969115c5ba6bcd69b9df7cf73b4e7cf59c73e5c24db66d313325b"
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
