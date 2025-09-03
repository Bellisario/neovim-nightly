cask "neovim-nightly" do
  version "nightly-f9ce939bf53b84f7e6e4ecca3875dd0c378991db"

  on_arm do
    sha256 "fffd745d0c87654214fd128d0a2beaf8c0fecaddaf1b97ea58d68fcf18d23dd8"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "c2c7ec0469b8acb178f95a42f97ccbe4bf52d2008d4fdffd5e2d3ba0da7a14f3"
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
