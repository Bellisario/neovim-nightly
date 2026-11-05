cask "neovim-nightly" do
  version "nightly-1332ed9027ff764ba554ff9e931015e1be9bc9cf"

  on_arm do
    sha256 "31749c885053645a692dd7ef3e3bdeb0ebc8d11e5202c7a1221a63382a2aa141"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "ed420d206df1ffa83db83dfbc4ec7a9a9bfa30e890fe4dfd94c50d69bce13cbd"
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
