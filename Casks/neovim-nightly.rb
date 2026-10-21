cask "neovim-nightly" do
  version "nightly-1944cb3201a5e729dbc4b0d614dfd355fd01620f"

  on_arm do
    sha256 "e74b4f287b366275f5d6dd078293525d2747fe3cae8509833f630bd739d804b1"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "3f26d5afdb6652288ab6a2899c44522cfd230c746e9bacaa964c579c1037e4a8"
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
