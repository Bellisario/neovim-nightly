cask "neovim-nightly" do
  version "nightly-a950e8ea9d38ab2e75f7341aea44c865b211584e"

  on_arm do
    sha256 "31f4fcb22100fc46522e737d0b8911a12e8728e99540b8ef257246bc82e8674d"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "bf5961e34be189046fb6f5caffd375e10a1eae5e57f088b04dbe3ddcf6cfb242"
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
