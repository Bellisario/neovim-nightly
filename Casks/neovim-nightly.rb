cask "neovim-nightly" do
  version "nightly-9f600c89143e59c023a08eb6b537b060e55b57e0"

  on_arm do
    sha256 "b591bf85214692c596b0d2b7db54019b3f10bb0c5b6b4ee9c23c5b0c135f9f04"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "b1d2aa2f562349f18e0444f814c21e22f0ae363ba6aee2c76b461c5ba1cb9894"
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
