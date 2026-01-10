cask "neovim-nightly" do
  version "nightly-cb77bd1b861aa4cb0c99c01efeb26e790263e219"

  on_arm do
    sha256 "2b29cc2c028997e17d259ce41f3908bb66f959472288a42f31b034456052f738"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "41796ecab1880fde6d89c7cc0daf2b0055f6abb4dd04223c572b4f4ea86d84c5"
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
