cask "neovim-nightly" do
  version "nightly-1bcf2d7f90d4b2de18bc7e409db98893f01a83f1"

  on_arm do
    sha256 "1e87205a25bc6500728dddb83eef308ce1e5e181f521bd1ede52d8366e5e831f"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "685ceae5d950ddf41ac89a879dfcde5f16ef11692beb7f47f88704ba15a0cf05"
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
