cask "neovim-nightly" do
  version "nightly-3a7989f4f4b2071bf436f730e363d0aee83ec1e5"

  on_arm do
    sha256 "b3b9fb07c71dc3ad893c2d77ddb194b47d2da7ec19df71dbf16d8fec694d34f6"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "75ff5d581142c3b9ecf9c7c6f126b8b8235fe94bb154a3a5a72736f07048eda1"
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
