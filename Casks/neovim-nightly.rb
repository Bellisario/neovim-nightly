cask "neovim-nightly" do
  version "nightly-7dbca1c4e2e83711df1ecd9f5e2a1612d64cc774"

  on_arm do
    sha256 "32884ef265df33a07224370e0f44df92f3b672edb315f9c751da99a13b5cf2cd"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "b2fe116bd924a6d52b3aafc92bfd70d5f56f859d400b768d4399712a97e5b9f4"
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
