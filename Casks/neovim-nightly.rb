cask "neovim-nightly" do
  version "nightly-d3b4f562a636a7f9df69a18c27d1e0d7bbad22a5"

  on_arm do
    sha256 "9ace19fc44e1546bcdd64ffbe6a341e20997cecf480c001cb17ef99603b448cf"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "194f49b2d476a3695f557b38dcc1a066890855385198990ebc5c46896127bd80"
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
