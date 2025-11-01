cask "neovim-nightly" do
  version "nightly-b92b95e2c26d5cea86acd3116ee029cc57676f14"

  on_arm do
    sha256 "873397c9dbc806bb6ac4aa3b3867064f054b38fce468f5d4d692d089770e1fdf"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "b4f9da189eed3de8dcf7908333c6b4b41b11d2a3b90c79a4935b7ced963ed18a"
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
