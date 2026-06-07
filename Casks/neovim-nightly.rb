cask "neovim-nightly" do
  version "nightly-ec7dab077bf6bf53794f2bc42010c977687094a6"

  on_arm do
    sha256 "1aa2d7fc79002601c53e697d8ae57bbcc7a613607f1f32d164ffa6db2f4069b9"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "5d2483656fe10bd1d72d313ecfdbc1957e67a7de9225fb810c7583c841ff7878"
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
