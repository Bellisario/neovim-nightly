cask "neovim-nightly" do
  version "nightly-e82aef2e22a57688dcc19a978cbe083349ad8a2a"

  on_arm do
    sha256 "11f87b42529d0c095b26cba4269605b31690d10cafa2dba9b96afbd62c572ae5"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "7274e1a1325a2cd3d1f4eef27f84d57994b85a55b5b1c3e9d4a37db966b2ba4a"
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
