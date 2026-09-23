cask "neovim-nightly" do
  version "nightly-51d7d99fe7c3625f524b47f3f5d041c6a5895f81"

  on_arm do
    sha256 "e0f11a08286b1f7664d749a99b8fe3bd0732623a274630b6fd579a3293d217ff"
    url "https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz",
        verified: "github.com/neovim"
    binary "nvim-macos-arm64/bin/nvim"
  end
  on_intel do
    sha256 "40a6bdc73256bfc37c14733de64595aacfb0967c6f3352a0e1021a576d66692b"
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
