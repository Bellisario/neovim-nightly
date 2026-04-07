cask "neovim-nightly" do
  version "nightly-6b0367481c6542bebb47f6e9a6b4eb419708ddaf"

  on_arm do
    sha256 "f9982c5dc0e6a93b2e984f6ae9261fc9ca9bc7da48cf71023accef7b45585e23"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "f3f1195a7104c25ece0b7fd40331dd8367abba9483a9bb0ff7d6d2f50108545d"
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
